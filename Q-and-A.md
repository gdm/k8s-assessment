
## Clarification about the assesment


> You will need to make a choice of delivering your solution in either Amazon EKS, Microsoft Azure Kubernetes Services (AKS) or in your local kubernetes cluster

It's an important choice because has to be made cautiously and together with the customer because it may be harder to change it in the future (in the real-world scenario of course)

> The customer is interested in migrating the complete environment to a MicroServiced approach.

Why he wants this migration? What is his biggest problems/challenges at this moment? What he likes in his current setup at this moment?
Where the customer wants to migrate (Azure or AWS or something else) and why?
How his CI/CD pipeline looks like at this moment? What he expect it will be after the migration?
Does he has any existing disaster recovery plan/backups, backup tests, etc?
What is his RPO and RTO?
What kind of monitoring system he has at this moment, does the customer counts SLO (service level objective)?


> some questions about existing application

Is there any specific needs for the application, like very quick ping, super high amount of RAM, special hardware, etc ?
Does the customer has SLA for their clients?
How the customers of the customer understand that the application works fast/slow ?
It would be nice to see list of the incidents with the availability of the application happened in the past (with summary and root cause analysis)
Is there any standards application/organization must comply at this moment or planning to comply in the future? (maybe its lso a question for the vendor)

> budget
> Cost optimization should be applied when necessary, even if a few application related modifications are necessary. Environment isolation is important, but some shared services would be acceptable if they result in major cost reduction.

Could you please give some example? (please also define a 'major cost reduction')
What is the current TCO (total cost of ownership)?


> They are not in a hurry, and they have given an indication that they want to go live on a Kubernetes setup 12 months after they have agreed on the vendor to support them in this journey.

May I request more info regarding the vendor and his role in the setup of the application? 
How the application planned to be change in 12 months? (changes related to the deployment, for example if they want to introduce geo-distributed architecture, any other major changes planned?)


