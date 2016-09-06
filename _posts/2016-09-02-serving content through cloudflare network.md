---
layout: post
title: Serving Content through Cloudflare network
date: 2016-09-02
category: ruby
---

# Cloudflare

Cloudflare, is an U.S. company which provides a content delivery network, internet security services, and distributed DNS services. It sits between visitor and Cloudflare user's hosting provider, acting as a reverse proxy for websites. The use of Cloudflare results in network security, fast page load, availability of sites for mobile.

I'd like to show you how I use DNS service provided by Cloudflare with my domain names. First you have to have a domain name registered and a [cloudflare](https://www.cloudflare.com) account. Now to add site with cloudflare, follow the given steps:

**Step 1: [Setup](https://www.cloudflare.com/a/setup)**
It will take about one minute to scan DNS records of your site.

**Step 2: Setup the CNAME, A records for your site** | Example: I'm using A records to point to github as I'm using github hosting.
![Example]({{ site.url }}/assests/img/cloudflare/cloudflare_setting.png)


**Step 3: Select a free cloudflare plan**


**Step 4: Change the nameservers to the nameservers provided by cloudflare**
![Nameserver]({{ site.url }}/assests/img/cloudflare/ns.png)
