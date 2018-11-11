---
title: "SSL Certificate Mess"
date: 2018-10-23T09:34:04+04:00
draft: true
---

I don't usually focus on lectures, especially if I did not know how I'm going to benefit from them. However, I admit that I should have paid more attention at networking classes.

'm currently managing different domains and subdomains that points to different hosting servers or landing pages while also using CloudFlare on some of them. I've usually depended on paid SSL certificates but never took the time to research what are the different options to secure my websites. In an effort to cut costs, I decided to get my hands dirty and learn what are the different options and what they offer.

After a basic research I discovered a new war in the list of internet wars. Apple vs. Samsung, Angular vs. React, Linux vs. the world, ... and Self-Signed vs. Certificate Authority. Many names and abbreviations raised up like Domain-Validation, Extended-Validation, certificate authority, self-signed certificates, Let's Encrypt, wildcard certificates, multi-domain certificates, CloudFlare Origin certificates, CloudFlare Edge certificates, AutoSSL and OpenSSL. It took me few days to get things straightened out and figure which is which, and I will try in this article to save you some of that time.

##  Know your requirements
To consider the options, start by choosing the type of certificate you need.
### 1: DV / OV / EV
**Domain-Validation (DV):** is a certificate that provides encryption to your website's connection. All you need to get a DV certificate is to prove you have control over the domain name.<br>
**> Encryption.**

**Organization-Validation (OV):** A certificate that proves the organization's existence and its control over the domain name.<br>
**> Encryption + Identification.**

**Extended-Validation (EV):** An OV certificate with higher authentication standards in addition to the browser green address bar.<br>
**> Encryption + Identification + Browser green address bar.**

{{< figure src="../greenAddressBar.png" caption="Browser's green address bar - credits webmasters.stackexchange.com" alt="Green Address Bar">}}

### 2: Wildcard or not
A wildcard certificate covers all subdomains of a website. (*.example.com).
### 3: Multi-domain (SAN SSL) or not
A multi-domain certificate covers multiple domains on one certificate. This certificate can be installed on the different domains (even with different hosting servers).

One thing to note here, the less domains on a certificate; the better. The number of domains can slow down the process of validating the certificate on each session.


## Consider the options

If you chose to go with OV or EV then your options are limited to the different certificate authorities and their offers.

In the case you decided Domain-Validation (DV) is good enough for your needs, then you'll have plenty of options to choose from. 

### Certificate Authorities
Certificate Authorities (CA) like GeoTrust, Thawte, Comodo, DegiCert and Symantec are entities where you can buy digital certificates from. They usually offer all different types of certificates for different prices. DV, OV, EV, single-domain, multi-domain, wildcard, ...etc under different brand names like PositiveSSL, EssentialSSL, InstantSSL. DV is the cheapest, most common, and covers most websites needs.

### Self-signed certificates
Self-signed certificates are digital certificates signed by the same person who it certifies (say I generate and sign a certificate for mshjri.com). This kind of certificate offers same-level encryption features as certificates signed by a certificate authority. However, it does not verify control over the domain. Thus, Chrome and many browsers will show the infamous 'not secure site' error to the visitors of a page with self-signed certificate.

### Let's Encrypt
[Let's Encrypt (LE)](letsencrypt.org) is a CA that issues DV certificates for free. It is an initiative supported by major companies like Mozilla, Google, and many more. However, there are few restrictions that comes with LE for now. If you are hosting your website on a shared hosting plan (or do not have root access for any reason) then you'll be at a disadvantage. Since you don't have root access you won't be able to install a Let's Encrypt client like Certbot on the server. A client helps you manage issuance and renewals of LE's certificates. You'll still have the option to issue, renew, and install certificates manually every 90 days, however, no wildcard support for manually issued certificates [[2]](#notes).


### AutoSSL
AutoSSL is a feature of cPanel dashboard. It lets you automate issuing and and installing free DV SSL certificates powered by either Comodo or Let's Encrypt [[3]](#notes). However it only works on a Virtual Private Servers (VPS) but not on shared hosting plans. This is a great option in case you prefer working with GUIs.


### CloudFlare
Cloudflare (CF) is a service that act as an intermediary between your visitors' browsers and your server. Basically a [CDN](https://en.wikipedia.org/wiki/Content_delivery_network). CloudFlare also offers many features (for free) that helps you admin all aspects of your website, from DNS records, Caching, forcing HTTPS, SSL certificates, DDoS protection and many more.

#### CF Edge Certificates
Since visitors to your website are served through CF servers, CF offers to serve free  SSL certificates to your users, meaning it will secure the connection between your visitors and CF servers.

{{< figure src="../edgeSSL.png" caption="Secure connection between visitors and CF servers only - credits cloudlfare.com" alt="Green Address Bar">}}

Accordingly, a shared SSL certificate will be present for your visitors, which means this certificate will include a list of different domains, that will also include your domain. In case you want CloudFlare to show your visitors a dedicated SSL certificate for you only, then you can choose between two paid options (5$ for one domain and 10$ for multi-domain per month).

#### Origin Certificates
Even though you've secured the connection between your visitors' browsers and CF servers, the connection to your origin server (hosting server) is not secure yet. This means any data being transferred back to your origin server from CF is not encrypted.

{{< figure src="../originSSL.png" caption="CF origin certificates secures the connection to your website's hosting server - credits cloudlfare.com" alt="Green Address Bar">}}

CloudFlare gives you the option to generate a self-signed certificate from its dashboard and install it manually on your origin server. You'd think think, why would I install a self-signed certificate on my server when most browsers do not trust it? When using CloudFlare services, browsers do not communicate with your origin server directly [[4]](#notes). Instead, only CloudFlare communicates with your origin server, thus you only need CloudFlare's trust.
This certificate will allow you to secure the connection to your origin server for up to 15 years without expiry.


## My personal take
In my opinion, DV is enough for most use cases, this includes personal websites, professional forums, and even start-up e-commerce sites. Wildcard support is quite important for me, because I do not prefer managing different certificates for one website. Nevertheless, I prefer not to use multi-domain certificates, it just makes it easier to manage and it also keeps other domains from being exposed to visitors of another domain. EV in e-commerce can be beneficial if you have the budget for it. 

On a completely different topic, I know that VPS can provide many options that shared hosting plans do not offer, yet I can't recommend either because it depends on your website's needs and your expertise. If your hosting a static site, just like this blog, a shared or even free hosting plan is way cheaper and easier to set up.

##  <a id="notes"></a>Notes
1. SSL (Secure Sockets Layer) abbreviation has been deprecated since 1999, and TLS (Transport Layer Security) came to replace it. However, 'SSL' is still commonly used on the internet.

2. There is actually a way to issue Let's Encrypt wildcard certificates manually through docker. Look [here](https://certbot.eff.org/docs/using.html#dns-plugins) for reference.

3. Let's Encrypt is not enabled by default in cPanel's AutoSSL, [here](https://blog.cpanel.com/announcing-cpanel-whms-official-lets-encrypt-with-autossl-plugin/) is how to enable it.

4. Your DNS routing has to be enabled through CloudFlare (The orange cloud symbol next to the DNS record in dashboard's DNS page).

1. Many people believe that SSL Certificate Authorities are a scam, and they do not provide any value for the internet. You can read about it [here](https://www.techrepublic.com/blog/it-security/the-tls-ssl-certifying-authority-system-is-a-scam/) & [here](https://serverfault.com/questions/503513/why-do-i-need-to-purchase-an-ssl-certificate-when-i-can-generate-one-locally).
