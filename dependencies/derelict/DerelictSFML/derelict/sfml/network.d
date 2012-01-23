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
module derelict.sfml.network;

public
{
    import derelict.sfml.ntypes;
    import derelict.sfml.nfuncs;
}

private
{
    import derelict.util.loader;
}

class DerelictSFMLNetworkLoader : SharedLibLoader
{
public:
    this()
    {
        super(
            "csfml-network.dll",
            "libcsfml-network.so,libcsfml-network.so.1.6",
            "../Frameworks/csfml-network.framework/csfml-network, /Library/Frameworks/csfml-network.framework/csfml-network, /System/Library/Frameworks/csfml-network.framework/csfml-network"
        );
    }

protected:
    override void loadSymbols()
    {
        // Ftp.h
        bindFunc(cast(void**)&sfFtpListingResponse_Destroy, "sfFtpListingResponse_Destroy");
        bindFunc(cast(void**)&sfFtpListingResponse_IsOk, "sfFtpListingResponse_IsOk");
        bindFunc(cast(void**)&sfFtpListingResponse_GetStatus, "sfFtpListingResponse_GetStatus");
        bindFunc(cast(void**)&sfFtpListingResponse_GetMessage, "sfFtpListingResponse_GetMessage");
        bindFunc(cast(void**)&sfFtpListingResponse_GetCount, "sfFtpListingResponse_GetCount");
        bindFunc(cast(void**)&sfFtpListingResponse_GetFilename, "sfFtpListingResponse_GetFilename");
        bindFunc(cast(void**)&sfFtpDirectoryResponse_Destroy, "sfFtpDirectoryResponse_Destroy");
        bindFunc(cast(void**)&sfFtpDirectoryResponse_IsOk, "sfFtpDirectoryResponse_IsOk");
        bindFunc(cast(void**)&sfFtpDirectoryResponse_GetStatus, "sfFtpDirectoryResponse_GetStatus");
        bindFunc(cast(void**)&sfFtpDirectoryResponse_GetMessage, "sfFtpDirectoryResponse_GetMessage");
        bindFunc(cast(void**)&sfFtpDirectoryResponse_GetDirectory, "sfFtpDirectoryResponse_GetDirectory");
        bindFunc(cast(void**)&sfFtpResponse_Destroy, "sfFtpResponse_Destroy");
        bindFunc(cast(void**)&sfFtpResponse_IsOk, "sfFtpResponse_IsOk");
        bindFunc(cast(void**)&sfFtpResponse_GetStatus, "sfFtpResponse_GetStatus");
        bindFunc(cast(void**)&sfFtpResponse_GetMessage, "sfFtpResponse_GetMessage");
        bindFunc(cast(void**)&sfFtp_Create, "sfFtp_Create");
        bindFunc(cast(void**)&sfFtp_Destroy, "sfFtp_Destroy");
        bindFunc(cast(void**)&sfFtp_Connect, "sfFtp_Connect");
        bindFunc(cast(void**)&sfFtp_LoginAnonymous, "sfFtp_LoginAnonymous");
        bindFunc(cast(void**)&sfFtp_Login, "sfFtp_Login");
        bindFunc(cast(void**)&sfFtp_Disconnect, "sfFtp_Disconnect");
        bindFunc(cast(void**)&sfFtp_KeepAlive, "sfFtp_KeepAlive");
        bindFunc(cast(void**)&sfFtp_GetWorkingDirectory, "sfFtp_GetWorkingDirectory");
        bindFunc(cast(void**)&sfFtp_GetDirectoryListing, "sfFtp_GetDirectoryListing");
        bindFunc(cast(void**)&sfFtp_ChangeDirectory, "sfFtp_ChangeDirectory");
        bindFunc(cast(void**)&sfFtp_ParentDirectory, "sfFtp_ParentDirectory");
        bindFunc(cast(void**)&sfFtp_MakeDirectory, "sfFtp_MakeDirectory");
        bindFunc(cast(void**)&sfFtp_DeleteDirectory, "sfFtp_DeleteDirectory");
        bindFunc(cast(void**)&sfFtp_RenameFile, "sfFtp_RenameFile");
        bindFunc(cast(void**)&sfFtp_DeleteFile, "sfFtp_DeleteFile");
        bindFunc(cast(void**)&sfFtp_Download, "sfFtp_Download");
        bindFunc(cast(void**)&sfFtp_Upload, "sfFtp_Upload");

        // Http.h
        bindFunc(cast(void**)&sfHttpRequest_Create, "sfHttpRequest_Create");
        bindFunc(cast(void**)&sfHttpRequest_Destroy, "sfHttpRequest_Destroy");
        bindFunc(cast(void**)&sfHttpRequest_SetField, "sfHttpRequest_SetField");
        bindFunc(cast(void**)&sfHttpRequest_SetMethod, "sfHttpRequest_SetMethod");
        bindFunc(cast(void**)&sfHttpRequest_SetURI, "sfHttpRequest_SetURI");
        bindFunc(cast(void**)&sfHttpRequest_SetHttpVersion, "sfHttpRequest_SetHttpVersion");
        bindFunc(cast(void**)&sfHttpRequest_SetBody, "sfHttpRequest_SetBody");
        bindFunc(cast(void**)&sfHttpResponse_Destroy, "sfHttpResponse_Destroy");
        bindFunc(cast(void**)&sfHttpResponse_GetField, "sfHttpResponse_GetField");
        bindFunc(cast(void**)&sfHttpResponse_GetStatus, "sfHttpResponse_GetStatus");
        bindFunc(cast(void**)&sfHttpResponse_GetMajorVersion, "sfHttpResponse_GetMajorVersion");
        bindFunc(cast(void**)&sfHttpResponse_GetMinorVersion, "sfHttpResponse_GetMinorVersion");
        bindFunc(cast(void**)&sfHttpResponse_GetBody, "sfHttpResponse_GetBody");
        bindFunc(cast(void**)&sfHttp_Create, "sfHttp_Create");
        bindFunc(cast(void**)&sfHttp_Destroy, "sfHttp_Destroy");
        bindFunc(cast(void**)&sfHttp_SetHost, "sfHttp_SetHost");
        bindFunc(cast(void**)&sfHttp_SendRequest, "sfHttp_SendRequest");

        // IPAddress.h
        bindFunc(cast(void**)&sfIPAddress_FromString, "sfIPAddress_FromString");
        bindFunc(cast(void**)&sfIPAddress_FromBytes, "sfIPAddress_FromBytes");
        bindFunc(cast(void**)&sfIPAddress_FromInteger, "sfIPAddress_FromInteger");
        bindFunc(cast(void**)&sfIPAddress_ToString, "sfIPAddress_ToString");
        bindFunc(cast(void**)&sfIPAddress_ToInteger, "sfIPAddress_ToInteger");
        bindFunc(cast(void**)&sfIPAddress_GetLocalAddress, "sfIPAddress_GetLocalAddress");
        bindFunc(cast(void**)&sfIPAddress_GetPublicAddress, "sfIPAddress_GetPublicAddress");
        bindFunc(cast(void**)&sfIPAddress_LocalHost, "sfIPAddress_LocalHost");

        // Packet.h
        bindFunc(cast(void**)&sfPacket_Create, "sfPacket_Create");
        bindFunc(cast(void**)&sfPacket_Destroy, "sfPacket_Destroy");
        bindFunc(cast(void**)&sfPacket_Append, "sfPacket_Append");
        bindFunc(cast(void**)&sfPacket_Clear, "sfPacket_Clear");
        bindFunc(cast(void**)&sfPacket_GetData, "sfPacket_GetData");
        bindFunc(cast(void**)&sfPacket_GetDataSize, "sfPacket_GetDataSize");
        bindFunc(cast(void**)&sfPacket_EndOfPacket, "sfPacket_EndOfPacket");
        bindFunc(cast(void**)&sfPacket_CanRead, "sfPacket_CanRead");
        bindFunc(cast(void**)&sfPacket_ReadBool, "sfPacket_ReadBool");
        bindFunc(cast(void**)&sfPacket_ReadInt8, "sfPacket_ReadInt8");
        bindFunc(cast(void**)&sfPacket_ReadUint8, "sfPacket_ReadUint8");
        bindFunc(cast(void**)&sfPacket_ReadInt16, "sfPacket_ReadInt16");
        bindFunc(cast(void**)&sfPacket_ReadUint16, "sfPacket_ReadUint16");
        bindFunc(cast(void**)&sfPacket_ReadInt32, "sfPacket_ReadInt32");
        bindFunc(cast(void**)&sfPacket_ReadUint32, "sfPacket_ReadUint32");
        bindFunc(cast(void**)&sfPacket_ReadFloat, "sfPacket_ReadFloat");
        bindFunc(cast(void**)&sfPacket_ReadDouble, "sfPacket_ReadDouble");
        bindFunc(cast(void**)&sfPacket_ReadString, "sfPacket_ReadString");
        bindFunc(cast(void**)&sfPacket_ReadWideString, "sfPacket_ReadWideString");
        bindFunc(cast(void**)&sfPacket_WriteBool, "sfPacket_WriteBool");
        bindFunc(cast(void**)&sfPacket_WriteInt8, "sfPacket_WriteInt8");
        bindFunc(cast(void**)&sfPacket_WriteUint8, "sfPacket_WriteUint8");
        bindFunc(cast(void**)&sfPacket_WriteInt16, "sfPacket_WriteInt16");
        bindFunc(cast(void**)&sfPacket_WriteUint16, "sfPacket_WriteUint16");
        bindFunc(cast(void**)&sfPacket_WriteInt32, "sfPacket_WriteInt32");
        bindFunc(cast(void**)&sfPacket_WriteUint32, "sfPacket_WriteUint32");
        bindFunc(cast(void**)&sfPacket_WriteFloat, "sfPacket_WriteFloat");
        bindFunc(cast(void**)&sfPacket_WriteDouble, "sfPacket_WriteDouble");
        bindFunc(cast(void**)&sfPacket_WriteString, "sfPacket_WriteString");
        bindFunc(cast(void**)&sfPacket_WriteWideString, "sfPacket_WriteWideString");

        // Selector.h
        bindFunc(cast(void**)&sfSelectorTCP_Create, "sfSelectorTCP_Create");
        bindFunc(cast(void**)&sfSelectorTCP_Destroy, "sfSelectorTCP_Destroy");
        bindFunc(cast(void**)&sfSelectorTCP_Add, "sfSelectorTCP_Add");
        bindFunc(cast(void**)&sfSelectorTCP_Remove, "sfSelectorTCP_Remove");
        bindFunc(cast(void**)&sfSelectorTCP_Clear, "sfSelectorTCP_Clear");
        bindFunc(cast(void**)&sfSelectorTCP_Wait, "sfSelectorTCP_Wait");
        bindFunc(cast(void**)&sfSelectorTCP_GetSocketReady, "sfSelectorTCP_GetSocketReady");
        bindFunc(cast(void**)&sfSelectorUDP_Create, "sfSelectorUDP_Create");
        bindFunc(cast(void**)&sfSelectorUDP_Destroy, "sfSelectorUDP_Destroy");
        bindFunc(cast(void**)&sfSelectorUDP_Add, "sfSelectorUDP_Add");
        bindFunc(cast(void**)&sfSelectorUDP_Remove, "sfSelectorUDP_Remove");
        bindFunc(cast(void**)&sfSelectorUDP_Clear, "sfSelectorUDP_Clear");
        bindFunc(cast(void**)&sfSelectorUDP_Wait, "sfSelectorUDP_Wait");
        bindFunc(cast(void**)&sfSelectorUDP_GetSocketReady, "sfSelectorUDP_GetSocketReady");

        // SocketTCP.h
        bindFunc(cast(void**)&sfSocketTCP_Create, "sfSocketTCP_Create");
        bindFunc(cast(void**)&sfSocketTCP_Destroy, "sfSocketTCP_Destroy");
        bindFunc(cast(void**)&sfSocketTCP_SetBlocking, "sfSocketTCP_SetBlocking");
        bindFunc(cast(void**)&sfSocketTCP_Connect, "sfSocketTCP_Connect");
        bindFunc(cast(void**)&sfSocketTCP_Listen, "sfSocketTCP_Listen");
        bindFunc(cast(void**)&sfSocketTCP_Accept, "sfSocketTCP_Accept");
        bindFunc(cast(void**)&sfSocketTCP_Send, "sfSocketTCP_Send");
        bindFunc(cast(void**)&sfSocketTCP_Receive, "sfSocketTCP_Receive");
        bindFunc(cast(void**)&sfSocketTCP_SendPacket, "sfSocketTCP_SendPacket");
        bindFunc(cast(void**)&sfSocketTCP_ReceivePacket, "sfSocketTCP_ReceivePacket");
        bindFunc(cast(void**)&sfSocketTCP_IsValid, "sfSocketTCP_IsValid");

        // SocketUDP.h
        bindFunc(cast(void**)&sfSocketUDP_Create, "sfSocketUDP_Create");
        bindFunc(cast(void**)&sfSocketUDP_Destroy, "sfSocketUDP_Destroy");
        bindFunc(cast(void**)&sfSocketUDP_SetBlocking, "sfSocketUDP_SetBlocking");
        bindFunc(cast(void**)&sfSocketUDP_Bind, "sfSocketUDP_Bind");
        bindFunc(cast(void**)&sfSocketUDP_Unbind, "sfSocketUDP_Unbind");
        bindFunc(cast(void**)&sfSocketUDP_Send, "sfSocketUDP_Send");
        bindFunc(cast(void**)&sfSocketUDP_Receive, "sfSocketUDP_Receive");
        bindFunc(cast(void**)&sfSocketUDP_SendPacket, "sfSocketUDP_SendPacket");
        bindFunc(cast(void**)&sfSocketUDP_ReceivePacket, "sfSocketUDP_ReceivePacket");
        bindFunc(cast(void**)&sfSocketUDP_IsValid, "sfSocketUDP_IsValid");
    }
}

DerelictSFMLNetworkLoader DerelictSFMLNetwork;

static this()
{
    DerelictSFMLNetwork = new DerelictSFMLNetworkLoader();
}

static ~this()
{
    if(SharedLibLoader.isAutoUnloadEnabled())
        DerelictSFMLNetwork.unload();
}