//
//  SSLCOMM.h
//  SmallDemo
//
//  Created by Curry on 13-6-8.
//  Copyright (c) 2013年 sinsoft. All rights reserved.
//

#ifndef __SmallDemo__SSLCOMM__
#define __SmallDemo__SSLCOMM__

#include <iostream>

#endif /* defined(__SmallDemo__SSLCOMM__) */
#ifndef SSLCOMM_H
#define SSLCOMM_H

#ifdef linux
#include <assert.h>
#include "openssl/pem.h"
#include "openssl/rsa.h"
#include "openssl/crypto.h"
#include "openssl/x509.h"
#include "openssl/ssl.h"
#include "openssl/err.h"
#include "openssl/rand.h"

#include "errno.h"
#include "sys/socket.h"
#include "netinet/in.h"
#include "unistd.h"
#include <arpa/inet.h>
#include <netdb.h>

#include "Utility.h"

#define APNS_DEV
#if defined(APNS_DEV)

#define CA_CERT_PATH    "./pem"
#define RSA_CLIENT_CERT     "./pem/a.pem"
#define RSA_CLIENT_KEY      "./pem/a.pem"
#define APPLE_HOST          "gateway.sandbox.push.apple.com"
#define APPLE_PORT          2195

#define APPLE_FEEDBACK_HOST "feedback.sandbox.push.apple.com"
#define APPLE_FEEDBACK_PORT 2196

#else
#define CA_CERT_PATH    "./pem"
#define RSA_CLIENT_CERT     "./pem/b.pem"
#define RSA_CLIENT_KEY      "./pem/b.pem"
#define APPLE_HOST          "gateway.push.apple.com"
#define APPLE_PORT          2195
#define APPLE_FEEDBACK_HOST "feedback.push.apple.com"
#define APPLE_FEEDBACK_PORT 2196
#endif


class CSSLComm
{
public:
    CSSLComm();
    ~CSSLComm();
    
    bool connected();
    bool ssl_connect(const char *host, int port, const char *certfile, const char *keyfile, const char* capath);
    void PushNotification(const char *pToken,const char *pMsg);
    
    void GenPushData(const char *pToken);
    int GenPayloadData(int badgeNum,const char *pMsg = NULL);
    
private:
    void Reset();
    
private:
    
    SSL_CTX         *m_pctx;
    SSL             *m_pssl;
    const SSL_METHOD      *m_pmeth;
    X509            *m_pserver_cert;
    EVP_PKEY        *m_pkey;
    
    
    struct sockaddr_in   m_server_addr;
    struct hostent      *m_phost_info;
    
    int                  m_sockfd;
    uint16 m_tokenLen;
    struct PUSHDATA
    {
        char szToken[1+2+32];
        char szPayload[2+256];
    }m_data;
    
    CSyncCritical m_lock;
};

#endif

#endif // SSLCOMM_H