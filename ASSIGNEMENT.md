
<a href="https://sentia.com/">
    <img src="assets/logo.jpg" alt="Sentia - Lead the way" title="Sentia" align="right" height="60" />
</a>

# Sentia Recruitment

Welcome to Sentia Recruitment

The purpose of this repository is to provide an assignment that will highlight the strengths required by a kubernetes consultant in our kubernetes consultancy workforce.

## Table of content

- [General Information](#general-information)
- [Assignment](#assignment)
    - [Transformation and Migration to MicroServices](#transformation-and-migration-to-MicroServices)
        - [Isolation](#Isolation)
        - [Remarks](#Remarks)
- [Deliverables](#deliverables)
- [Links](#links)
- [License](#license)

## General Information

This assignment is meant to challenge the potential applicant in the complete spectrum of designing a solution and delivering an environment in a Kubernetes environment using Infrastructure as Code (IaC).

Please be aware of the fact that we are not only looking at the actual deliverables but also the process followed to achieve these results. *The presentation of the results is of equal importance to the actual results.*

You will need to make a choice of delivering your solution in either **Amazon EKS** or **Microsoft Azure Kubernetes Services (AKS)**.

## Assignment

### Transformation and Migration to MicroServices

You have participated in a meeting with a client to assess their strategy to migrate their application to MicroServiced approach. They are currently hosting a customer facing web application on their on premise environment based on a NodeJS application behind an NGINX reverse proxy. They are utilizing a MongoDB cluster for storing data as well as an FTP server for their web pages files/code. They also maintain a cron server, mostly Bash and Python scripts, relevant to a small amount of jobs that needs to be executed a few times per day (no more than once per hour). Additionally, the client is developing a brand new API, and would like to host it on the new setup.
All the above services are hosted on several virtual machines at the client's OnPremises datacenter.

Finally, the customer currently has 3 environments, namely Development (DEV), Test (TST) and Production (PRD).

The customer is interested in migrating the complete environment to a MicroServiced approach. They are not in a hurry, and they have given an indication that they want to go live on a Kubernetes setup 12 months after they have agreed on the vendor to support them in this journey. They want to make sure that they have enough time to adjust the application to any technology related changes originating from an infrastructure perspective.

#### Isolation

Only the NodeJS application and the API are allowed to access the MongoDB instance.
The cronjob must access only the API application.

#### Remarks

There is a soft requirement for exporting all application and infrastructure logs to an ElasticSearch Cluster. The customer needs to have access to the Kibana dashboard within their headquarters but the cluster/dashboard *should not* be publicly accessible.

The API application must answer on the same url as the nodejs application.

There is a bug in the client's NodeJS application that expects a file being created at /opt/node_reporting_bug/gambiarra.md before the NodeJS application starts. The file must contain the value ("The greatest teacher") of a secret (node-gambi) and the phrase "failure is." in order to the NodeJS app to start.

You have undertaken the task to design the future state of this environment in a kubernetes platform.
The solution needs to:
* (must) be scalable and flexible.
* (must) utilize managed services only if kubernetes cannot offer or depends on.
* (must) persist data.
* (must) workaround the NodeJS major bug in an automated way.
* (nice to have) be modernized during this migration in terms of infrastructure technologies used.

Cost optimization should be applied when necessary, even if a few application related modifications are necessary. Environment isolation is important, but some shared services would be acceptable if they result in major cost reduction.

## Deliverables

Please provide the following:
1. An architectural design for all the components and all the environments.
2. An IaC project for deploying an MVP demo.
    * for Kubernetes, write your IaC using: **YAML** and/or **Automated KubeCTL command scripts**
    * for AWS, write your IaC using: **AWS CDK** (preferred), or alternatively with AWS CloudFormation.
    * for Azure, write your IaC using: **Bicep** (preferred), or alternatively with ARM Templates.
3. Include a simple time log of the activities you have performed.
4. Document any assumptions and decisions you have made.
5. A GIT repo with all the above.

## Links

- [The twelve-factor app](https://12factor.net/)
- [Draw.io](https://www.draw.io/)
- [AWS Well-Architected](https://aws.amazon.com/architecture/well-architected/)
- [Microsoft Azure Cloud Design Patterns](https://docs.microsoft.com/en-us/azure/architecture/patterns/)
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)

## License

Copyright © 2019-2021, [Sentia](https://sentia.com). All rights reserved.
