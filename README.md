# Shopware 5 demo shop with docker

## Docker setup

This repository is based on the official shopware 5 repository and enhances its sources to be started in less than 
10 minutes with a full installed 

- nginx
- php7.0    
- redis (for session management) 
- mysql 5.7

and ready to develop

- xdebug
- ant
- blackfire
- new relic
- logging to docker logging driver


![](./docker/demo_shop.png)


### Install docker

![](./docker/horizontal_small.png)

https://www.docker.com/

e.g. for ubuntu: https://www.docker.com/docker-ubuntu


```bash

sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

sudo apt-get update

sudo apt-get -y install docker-ce

```

### Install docker-compose

e.g. for ubuntu: https://github.com/docker/compose/releases

```bash

curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

```

### Configure blackfire and papertrail

Configure your blackfire server token and your papertrail port.

```yaml
blackfire:
    image: blackfire/blackfire
    environment:
      BLACKFIRE_SERVER_ID: your-server-id
      BLACKFIRE_SERVER_TOKEN: your-server-token
    networks:
        - front
        - back

  logspout:
      image: gliderlabs/logspout
      volumes:
        - /var/run/docker.sock:/tmp/docker.sock
      command: syslog+tls://logs5.papertrailapp.com:your-papertrail-port
```

### Startup shop infrastructure

```bash

cd /your-shop-root-folder/

docker-compose up -d

```

### Install the shop (with demo data)

```bash

chmod +x bin/*
bin/docker-install


```

### Hostfile entries

If you want to develop on your own VM add host file entries

**Linux**

```sh
echo "127.0.0.1    dev.shopware.io www.shopware.io" >> /etc/hosts
```

**OS X** (Docker Toolbox)

```sh
echo "192.168.99.100    dev.shopware.io www.shopware.io" >> /etc/hosts
```

**OS X** (Docker for Mac)

```sh
echo "127.0.0.1    dev.shopware.io www.shopware.io" >> /etc/hosts
```

### Open your shop in your browser

Open http://dev.shopware.io/

in your browser.

That's it.

## Shopware project


[![Build Status](https://travis-ci.org/shopware/shopware.svg?branch=5.2)](https://travis-ci.org/shopware/shopware)
[![Crowdin](https://d322cqt584bo4o.cloudfront.net/shopware/localized.svg)](https://crowdin.com/project/shopware)

- **License**: Dual license AGPL v3 / Proprietary
- **Github Repository**: <https://github.com/shopware/shopware>
- **Issue Tracker**: <https://issues.shopware.com>

## Overview

![Shopware 5 collage](http://cdn.shopware.de/github/readme_screenshot.png)

Shopware 5 is the next generation of open source e-commerce software made in Germany. Based on bleeding edge technologies like `Symfony 2`, `Doctrine 2` & `Zend Framework` Shopware comes as the perfect platform for your next e-commerce project.
Furthermore Shopware 5 provides an event-driven plugin system and an advanced hook system, giving you the ability to customize every part of the platform.

Visit the forum at <http://forum.shopware.com/>

### Shopware Server Requirements

- PHP 5.6.4 or above
- [Apache 2.2 or 2.4](https://httpd.apache.org/)
- Apache's `mod_rewrite` module
- MySQL 5.5.0 or above

#### Required PHP extensions:

-   <a href="http://php.net/manual/en/book.ctype.php" target="_blank">ctype</a>
-   <a href="http://php.net/manual/en/book.curl.php" target="_blank">curl</a>
-   <a href="http://php.net/manual/en/book.dom.php" target="_blank">dom</a>
-   <a href="http://php.net/manual/en/book.hash.php" target="_blank">hash</a>
-   <a href="http://php.net/manual/en/book.iconv.php" target="_blank">iconv</a>
-   <a href="http://php.net/manual/en/book.image.php" target="_blank">gd</a> (with freetype and libjpeg)
-   <a href="http://php.net/manual/en/book.json.php" target="_blank">json</a>
-   <a href="http://php.net/manual/en/book.mbstring.php" target="_blank">mbstring</a>
-   <a href="http://php.net/manual/en/book.openssl.php" target="_blank">OpenSSL</a>
-   <a href="http://php.net/manual/en/book.session.php" target="_blank">session</a>
-   <a href="http://php.net/manual/en/book.simplexml.php" target="_blank">SimpleXML</a>
-   <a href="http://php.net/manual/en/book.xml.php" target="_blank">xml</a>
-   <a href="http://php.net/manual/en/book.zip.php" target="_blank">zip</a>
-   <a href="http://php.net/manual/en/book.zlib.php" target="_blank">zlib</a>
-   <a href="http://php.net/manual/en/ref.pdo-mysql.php" target="_blank">PDO/MySQL</a>

### Installation via Git

Follow the instruction below if you want to install Shopware 5 using Git.

1.) Clone the git repository to the desired location using:

    git clone https://github.com/shopware/shopware.git

In case you wish to contribute to Shopware, fork the `5.2` branch rather than cloning it, and create a pull request via Github. For further information please read the section "Get involved" of this document.

2.) Set the correct directory permissions:

    chmod -R 755 var
    chmod -R 755 web
    chmod -R 755 files
    chmod -R 755 media
    chmod -R 755 engine/Shopware/Plugins/Community

Depending on your server configuration, it might be necessary to set whole write permissions (777) to the files and folders above.
You can also start testing with lower permissions due to security reasons (644 for example) as long as your php process can write to those files.

3.) An [Ant](http://ant.apache.org/) Buildfile is used to set up the configuration and database connection:

    cd build/
    ant configure
    ant build-unit

4.) Download the test images and extract them:

Go to the root directory of your shopware system and download the test images:

	wget -O test_images.zip http://releases.s3.shopware.com/test_images.zip

Unzip the files inside the root directory:

	unzip test_images.zip

You can now access your shop

# Backend

The backend is located at `/backend` example `http://your.shop.com/backend`.
Backend Login: demo/demo

The test_images.zip file includes thumbnails for the new responsive theme and the old deprecated template.

If you want to have full featured demo data, you should download the respective demo data plugin in the First Run Wizard or in the Plugin Manager.

# Get involved

Shopware is available under dual license (AGPL v3 and proprietary license). If you want to contribute code (features or bugfixes), you have to create a pull request and include valid license information. You can either contribute your code under New BSD or MIT license.

If you want to contribute to the backend part of Shopware, and your changes affect or are based on ExtJS code, they must be licensed under GPL V3, as per license requirements from Sencha Inc.

If you are not sure which license to use, or want more details about available licensing or the contribution agreements we offer, you can contact us at <contact@shopware.com>.

For more information about contributing to Shopware, please see [CONTRIBUTING.md](CONTRIBUTING.md).


### How to report bugs / request features?

We've always had a sympathetic ear for our community, so please feel free to submit tickets with bug reports or feature requests. In order to have a single issue tracking tool, we've decided to close the GitHub issue panel in favor of our Jira issue tracker, which is directly connected to our development division.

* [Shopware Jira ticket submit form](https://issues.shopware.com)

# Copying / License

Shopware is distributed under a dual license (AGPL v3 and proprietary license). You can find the whole license text in the `license.txt` file.

# Changelog

The changelog and all available commits are located under <https://github.com/shopware/shopware/commits/5.2>.

## Further reading

* [Shopware AG](http://www.shopware.com) - Homepage of shopware AG
* [Shopware Developer Documentation](https://devdocs.shopware.com/)
* [Shopware Community](http://community.shopware.com/) - Shopware Community
* [Shopware Forum](http://forum.shopware.com) - Community forum
* [Shopware Marketplace](http://store.shopware.com) - Shopware Store
* [Shopware on Crowdin](https://crowdin.com/project/shopware) - Crowdin (Translations)
