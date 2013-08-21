//
//  SSLCOMM.cpp
//  SmallDemo
//
//  Created by Curry on 13-6-8.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#ifdef linux

#include "SSLCOMM.h

CSSLCOMM::CSSLCOMM()
{
    //ctor
    m_sockfd = -1;
    m_pctx = NULL;
    m_pssl = NULL;
    m_pmeth = NULL;
    m_pserver_cert = NULL;
    m_pkey = NULL;
    
    m_tokenLen = htons(32);
    memset((void*)&m_data,0,sizeof(m_data));
    
}

CSSLCOMM::~CSSLCOMM()
{
    //dtor
    Reset();
    
}
void CSSLCOMM::Reset()
{
    
    if(m_pssl)
    {
        SSL_shutdown(m_pssl);
        SSL_free(m_pssl);
        m_pssl = NULL;
    }
    if(m_pctx)
    {
        SSL_CTX_free(m_pctx);
        m_pctx = NULL;
    }
    if(m_sockfd > 2)
    {
        close(m_sockfd);
        m_sockfd = -1;
    }
    
}


bool CSSLCOMM::connected()
{
    if(m_sockfd < 2) return false;
    
    struct timeval timeout;
    timeout.tv_sec = 0;
    timeout.tv_usec = 0;
    fd_set fdwrite;
    fd_set fdexcept;
    FD_ZERO(&fdwrite);
    FD_ZERO(&fdexcept);
    FD_SET(m_sockfd,&fdwrite);
    FD_SET(m_sockfd,&fdexcept);
    int ret = select(m_sockfd+1,NULL,&fdwrite,&fdexcept,&timeout);
    if(ret == -1)
        return false;
    if(ret > 0)
    {
        if(FD_ISSET(m_sockfd,&fdexcept))
            return false;
        else if(FD_ISSET(m_sockfd,&fdwrite))
        {
            int err = 0;
            socklen_t len = sizeof(err);
            int result = getsockopt(m_sockfd,SOL_SOCKET,SO_ERROR,(char*)&err,&len);
            if(result < 0 || err != 0)
                return false;
            return true;
        }
    }
    return false;
}


bool CSSLCOMM::ssl_connect(const char *host, int port, const char *certfile, const char *keyfile, const char* capath)
{
    Reset();
    
    int err;
    
    
    SSL_library_init();
    
    
    SSL_load_error_strings();
    
    
    m_pmeth = SSLv3_method();
    
    
    m_pctx = SSL_CTX_new(m_pmeth);
    if(!m_pctx)
    {
        printf("Could not get SSL Context\n");
        return false;
    }
    
    
    if(SSL_CTX_load_verify_locations(m_pctx, NULL, capath) <= 0)
    {
        
        printf("Failed to set CA location...\n");
        ERR_print_errors_fp(stderr);
        return false;
    }
    
    
    if (SSL_CTX_use_certificate_file(m_pctx, certfile, SSL_FILETYPE_PEM) <= 0)
    {
        printf("Cannot use Certificate File\n");
        ERR_print_errors_fp(stderr);
        return false;
    }
    
    
    if (SSL_CTX_use_PrivateKey_file(m_pctx, keyfile, SSL_FILETYPE_PEM) <= 0)
    {
        printf("Cannot use Private Key\n");
        ERR_print_errors_fp(stderr);
        return false;
    }
    
    
    if (!SSL_CTX_check_private_key(m_pctx))
    {
        printf("Private key does not match the certificate public key\n");
        return false;
    }
    
    
    m_sockfd = socket (PF_INET, SOCK_STREAM, IPPROTO_TCP);
    if(m_sockfd == -1)
    {
        printf("Could not get Socket\n");
        return false;
    }
    
    memset (&m_server_addr, '\0', sizeof(m_server_addr));
    m_server_addr.sin_family      = AF_INET;
    m_server_addr.sin_port        = htons(port);
    m_phost_info = gethostbyname(host);
    if(m_phost_info)
    {
        
        struct in_addr *address = (struct in_addr*)m_phost_info->h_addr_list[0];
        m_server_addr.sin_addr.s_addr = inet_addr(inet_ntoa(*address));
        
    }
    else
    {
        printf("Could not resolve hostname %s\n", host);
        return false;
    }
    
    
    err = connect(m_sockfd, (struct sockaddr*) &m_server_addr, sizeof(m_server_addr));
    if(err == -1)
    {
        printf("Could not connect\n");
        return false;
    }
    
    
    m_pssl = SSL_new(m_pctx);
    if(!m_pssl)
    {
        printf("Could not get SSL Socket\n");
        return false;
    }
    
    
    SSL_set_fd(m_pssl, m_sockfd);
    
    
    err = SSL_connect(m_pssl);
    if(err == -1)
    {
        printf("Could not connect to SSL Server\n");
        return false;
    }
    return true;
    
}

void CSSLCOMM::PushNotification(const char *pToken,const char *pMsg)
{
    CMyLock lock(&m_lock);
    if(!connected())
    {
        ssl_connect(APPLE_HOST, APPLE_PORT, RSA_CLIENT_CERT, RSA_CLIENT_KEY, CA_CERT_PATH);
    }
    int paylen = GenPayloadData(1,pMsg);
    GenPushData(pToken);
    int ret = SSL_write(m_pssl, (void*)&m_data, 35 + paylen);
    //printf("ret = %d \n",ret);
}

void CSSLCOMM::GenPushData(const char *pToken)
{
    char *ptr = m_data.szToken;
    *ptr++ = 0;
    memcpy(ptr,&m_tokenLen,2);
    ptr += 2;
    memcpy(ptr,pToken,32);
}

int CSSLCOMM::GenPayloadData(int badgeNum,const char *pMsg)
{
    char buf[256] = {0};
    char badgeBuf[3] = {0};
    strcpy(&m_data.szPayload[2], "{\"aps\":{");
    if(pMsg != NULL)
    {
        strcat(&m_data.szPayload[2], "\"alert\":");
        snprintf(buf, sizeof(buf)-1,"\"%s\",", pMsg);
        strcat(&m_data.szPayload[2],buf);
    }
    if(badgeNum > 99 || badgeNum < 0) badgeNum = 1;
    snprintf(badgeBuf, sizeof(badgeBuf)-1,"%d", badgeNum);
    strcat(&m_data.szPayload[2], "\"badge\":");
    strcat(&m_data.szPayload[2], badgeBuf);
    strcat(&m_data.szPayload[2], ",\"sound\":\"msg.wav\"}");
    
    
    snprintf(buf, sizeof(buf)-1,",\"%s\":\"%d\"", "forum_id",88);
    strcat(&m_data.szPayload[2],buf);
    
    snprintf(buf, sizeof(buf)-1,",\"%s\":\"%d\"", "topic_id",999);
    strcat(&m_data.szPayload[2],buf);
    
    strcat(&m_data.szPayload[2],"}");
    int len = strlen(&m_data.szPayload[2]);
    assert(len <= 256);
    uint16_t payload_len = htons(len);
    memcpy(m_data.szPayload,&payload_len,sizeof(payload_len));
    return len + 2;
}

#endif