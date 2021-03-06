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
module derelict.ogg.vorbistypes;

private
{
    import derelict.util.compat;
    import derelict.ogg.oggtypes;
}

enum
{
    OV_FALSE      = -1,
    OV_EOF        = -2,
    OV_HOLE       = -3,
    OV_EREAD      = -128,
    OV_EFAULT     = -129,
    OV_EIMPL      = -130,
    OV_EINVAL     = -131,
    OV_ENOTVORBIS = -132,
    OV_EBADHEADER = -133,
    OV_EVERSION   = -134,
    OV_ENOTAUDIO  = -135,
    OV_EBADPACKET = -136,
    OV_EBADLINK   = -137,
    OV_ENOSEEK    = -138,
}

struct vorbis_info
{   int _version; // Renamed from "version", since that's a keyword in D
    int channels;
    int rate;
    c_long bitrate_upper;
    c_long bitrate_nominal;
    c_long bitrate_lower;
    c_long bitrate_window;

    void *codec_setup;
}

struct vorbis_dsp_state
{   int analysisp;
    vorbis_info *vi;

    float **pcm;
    float **pcmret;
    int      pcm_storage;
    int      pcm_current;
    int      pcm_returned;

    int  preextrapolate;
    int  eofflag;

    c_long  lW;
    c_long  W;
    c_long  nW;
    c_long  centerW;

    ogg_int64_t granulepos;
    ogg_int64_t sequence;

    ogg_int64_t glue_bits;
    ogg_int64_t time_bits;
    ogg_int64_t floor_bits;
    ogg_int64_t res_bits;

    void       *backend_state;
}


struct vorbis_block
{
    float  **pcm;
    oggpack_buffer opb;
    c_long   lW;
    c_long   W;
    c_long   nW;
    int   pcmend;
    int   mode;
    int         eofflag;
    ogg_int64_t granulepos;
    ogg_int64_t sequence;
    vorbis_dsp_state *vd;
    void               *localstore;
    c_long              localtop;
    c_long              localalloc;
    c_long              totaluse;
    alloc_chain *reap;
    c_long  glue_bits;
    c_long  time_bits;
    c_long  floor_bits;
    c_long  res_bits;

    void *internal;
}

struct alloc_chain
{     void *ptr;
      alloc_chain *next;
}

struct vorbis_comment
{
    char **user_comments;
    int   *comment_lengths;
    int    comments;
    char  *vendor;
}