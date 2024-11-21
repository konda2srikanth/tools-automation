# tools-automation

This repository holds all the terraform code for Tools Infrastructure provisioning and the associated configuration management using ANSIBLE ( roles )



### Vault Installation :

Ref: https://developer.hashicorp.com/vault/install?ajs_aid=b6137d6a-761d-417b-90b7-a5009fe8a78e&product_intent=vault
     https://foxutech.com/hashicorp-vault-how-to-setup-on-linux/
```
    $ sudo yum install -y yum-utils
    $ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    $ sudo yum -y install vault
    $ vault version  ( check the verison and to validate the installation of valut )
    $ vault server -help
    $ vault server -config=/opt/vault.hcl                    # Start a server with a configuration file

```

Vault config file:

```
$ cat /opt/vault.hcl
ui = true
storage "file" {
  path = "/vault-data"
}
listener "tcp" {
 address     = "0.0.0.0:8200"
 tls_disable = 1
}
```



### Prometheus Philosophy :
1) They offer metrics that are not really sensitive
2) That would be the reason why you don't find authentication to prometheus



# Prometheus :
  1) Service Discover Mechanism, using this we can tell what to monitor and what not to monitor.





# ELK Stack Installation :

Ref: https://www.elastic.co/guide/en/elasticsearch/reference/current/rpm.html

Repo :
$ vim /etc/yum.repos.d/elastic.repo 
```
[elasticsearch]
name=Elasticsearch repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=0
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
```

$ sudo dnf install  elasticsearch  -y

```
--------------------------- Security autoconfiguration information ------------------------------

Authentication and authorization are enabled.
TLS for the transport and HTTP layers is enabled and configured.

The generated password for the elastic built-in superuser is : TbQwX+BQ-YPsJ0WyL6bJ

    If this node should join an existing cluster, you can reconfigure this with
    '/usr/share/elasticsearch/bin/elasticsearch-reconfigure-node --enrollment-token <token-here>'
    after creating an enrollment token on your existing cluster.

    You can complete the following actions at any time:

    Reset the password of the elastic built-in superuser with
    '/usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic'.

    Generate an enrollment token for Kibana instances with
    '/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana'.

    Generate an enrollment token for Elasticsearch nodes with
    '/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s node'.

    -------------------------------------------------------------------------------------------------
    ### NOT starting on installation, please execute the following statements to configure elasticsearch service to start automatically using systemd
    sudo systemctl daemon-reload
    sudo systemctl enable elasticsearch.service
    ### You can start elasticsearch service by executing
    sudo systemctl start elasticsearch.service

```

$ dnf install kibana 