## jenkins-jnlp

### Role variables

List of default variables available in the inventory:

```YAML
---
# defaults file for ansible-role-jenkins-jnlp
prerequisite_packages:
  debian:
    - openjdk-11-jre-headless
    - curl
    - python3-pip
version: 4.7
```

### Authors and license

`jenkins-jnlp` role was written by:

- [Bruce Becker](https://jenkins.uefa.ch) | [e-mail](mailto:uefa-devops@uefa.ch)

License: [MIT](https://tldrlegal.com/license/mit-license)
