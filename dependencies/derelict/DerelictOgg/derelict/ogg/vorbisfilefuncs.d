/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.ogg.vorbisfilefuncs;

private
{
    import derelict.util.compat;
    import derelict.ogg.oggtypes;
    import derelict.ogg.vorbistypes;
    import derelict.ogg.vorbisfiletypes;

    version(Tango)
        import tango.stdc.stdio : FILE, fclose, fread, ftell, fseek;
    else
        import std.c.stdio : FILE, fclose, fread, ftell, fseek;
}

extern(C)
{
    alias int function(OggVorbis_File*) da_ov_clear;
    alias int function(void* datasource, OggVorbis_File*, CCPTR, c_long, ov_callbacks) da_ov_open_callbacks;
    alias int function(void*, OggVorbis_File*, CCPTR, c_long, ov_callbacks) da_ov_test_callbacks;
    alias int function(OggVorbis_File*) da_ov_test_open;
    alias c_long function(OggVorbis_File*, int) da_ov_bitrate;
    alias c_long function(OggVorbis_File*) da_ov_bitrate_instant;
    alias c_long function(OggVorbis_File*) da_ov_streams;
    alias c_long function(OggVorbis_File*) da_ov_seekable;
    alias c_long function(OggVorbis_File*, int) da_ov_serialnumber;
    alias ogg_int64_t function(OggVorbis_File*, int) da_ov_raw_total;
    alias ogg_int64_t function(OggVorbis_File*, int) da_ov_pcm_total;
    alias double function(OggVorbis_File*, int) da_ov_time_total;
    alias int function(OggVorbis_File*, ogg_int64_t) da_ov_raw_seek;
    alias int function(OggVorbis_File*, ogg_int64_t) da_ov_pcm_seek;
    alias int function(OggVorbis_File*, ogg_int64_t) da_ov_pcm_seek_page;
    alias int function(OggVorbis_File*, double) da_ov_time_seek;
    alias int function(OggVorbis_File*, double) da_ov_time_seek_page;
    alias int function(OggVorbis_File*, ogg_int64_t) da_ov_raw_seek_lap;
    alias int function(OggVorbis_File*, ogg_int64_t) da_ov_pcm_seek_lap;
    alias int function(OggVorbis_File*, ogg_int64_t) da_ov_pcm_seek_page_lap;
    alias int function(OggVorbis_File*, double) da_ov_time_seek_lap;
    alias int function(OggVorbis_File*, double) da_ov_time_seek_page_lap;
    alias ogg_int64_t function(OggVorbis_File*) da_ov_raw_tell;
    alias ogg_int64_t function(OggVorbis_File*) da_ov_pcm_tell;
    alias double function(OggVorbis_File*) da_ov_time_tell;
    alias vorbis_info* function(OggVorbis_File*, int) da_ov_info;
    alias vorbis_comment* function(OggVorbis_File*, int) da_ov_comment;
    alias c_long function(OggVorbis_File*, float***, int, int*) da_ov_read_float;
    alias c_long function(OggVorbis_File*, char*, int, int, int, int, int*) da_ov_read_filter;
    alias c_long function(OggVorbis_File*, byte*, int, int, int, int, int*) da_ov_read;
    alias int function(OggVorbis_File*, OggVorbis_File*) da_ov_crosslap;
    alias int function(OggVorbis_File*, int) da_ov_halfrate;
    alias int function(OggVorbis_File*) da_ov_halfrate_p;
}

private extern (C)
{
    size_t Derelict_VorbisRead(void* ptr, size_t byteSize, size_t sizeToRead, void* datasource)
    {
        return fread(ptr, byteSize, sizeToRead, cast(FILE*)datasource);
    }
    int Derelict_VorbisSeek(void* datasource, ogg_int64_t offset, int whence)
    {
        return fseek(cast(FILE*)datasource, cast(int)offset, whence);
    }
    int Derelict_VorbisClose(void* datasource)
    {
        return fclose(cast(FILE*)datasource);
    }
    c_long Derelict_VorbisTell(void* datasource)
    {
        return cast(c_long)ftell(cast(FILE*)datasource);
    }
}

// ov_open is rewritten below because of incompatibility between compilers with FILE struct
// Using this wrapper, it*should* work exactly as it would in c++. --JoeCoder
int ov_open(FILE* f, OggVorbis_File* vf, CCPTR initial, c_long ibytes)
{
    // Fill the ov_callbacks structure
    ov_callbacks    vorbisCallbacks;    // Structure to hold pointers to callback functions
    vorbisCallbacks.read_func  = &Derelict_VorbisRead;
    vorbisCallbacks.close_func = &Derelict_VorbisClose;
    vorbisCallbacks.seek_func  = &Derelict_VorbisSeek;
    vorbisCallbacks.tell_func  = &Derelict_VorbisTell;

    return ov_open_callbacks(cast(void*)f, vf, initial, cast(int)ibytes, vorbisCallbacks);
}

// ditto for ov_test
int ov_test(FILE* f, OggVorbis_File* vf, CCPTR initial, c_long ibytes)
{
    // Fill the ov_callbacks structure
    ov_callbacks    vorbisCallbacks;    // Structure to hold pointers to callback functions
    vorbisCallbacks.read_func  = &Derelict_VorbisRead;
    vorbisCallbacks.close_func = &Derelict_VorbisClose;
    vorbisCallbacks.seek_func  = &Derelict_VorbisSeek;
    vorbisCallbacks.tell_func  = &Derelict_VorbisTell;

    return ov_test_callbacks(cast(void*)f, vf, initial, cast(int)ibytes, vorbisCallbacks);
}

mixin(gsharedString!() ~
"
da_ov_clear ov_clear;
da_ov_open_callbacks ov_open_callbacks;
da_ov_test_callbacks ov_test_callbacks;
da_ov_test_open ov_test_open;
da_ov_bitrate ov_bitrate;
da_ov_bitrate_instant ov_bitrate_instant;
da_ov_streams ov_streams;
da_ov_seekable ov_seekable;
da_ov_serialnumber ov_serialnumber;
da_ov_raw_total ov_raw_total;
da_ov_pcm_total ov_pcm_total;
da_ov_time_total ov_time_total;
da_ov_raw_seek ov_raw_seek;
da_ov_pcm_seek ov_pcm_seek;
da_ov_pcm_seek_page ov_pcm_seek_page;
da_ov_time_seek ov_time_seek;
da_ov_time_seek_page ov_time_seek_page;
da_ov_raw_seek_lap ov_raw_seek_lap;
da_ov_pcm_seek_lap ov_pcm_seek_lap;
da_ov_pcm_seek_page_lap ov_pcm_seek_page_lap;
da_ov_time_seek_lap ov_time_seek_lap;
da_ov_time_seek_page_lap ov_time_seek_page_lap;
da_ov_raw_tell ov_raw_tell;
da_ov_pcm_tell ov_pcm_tell;
da_ov_time_tell ov_time_tell;
da_ov_info ov_info;
da_ov_comment ov_comment;
da_ov_read_float ov_read_float;
da_ov_read_filter ov_read_filter;
da_ov_read ov_read;
da_ov_crosslap ov_crosslap;
da_ov_halfrate ov_halfrate;
da_ov_halfrate_p ov_halfrate_p;
");