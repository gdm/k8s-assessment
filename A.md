Answered by Renan S. Morilha in the email from Oct 25, 2021, 3:07 PM

The platform choice to build your environment is fully yours, for implementation and design purposes. You are free to assume that the customer chose one of the options (Azure, AWS... and so on).
Item-by-tem:
Simple scenario. As the assessment says, the hypothetical customer has this need in order to achieve scalability and move away from the traditional infrastructure of datacenters. Again, it's your free choice since you meet the requirements of the customer (scalability, your solution must be kubernetes driven).
There is no specific in regards to which cloud to use. It's your free choice to go with the one you feel most comfortable with.
There is no CI/CD pipeline in the customer. The assessment aims to test your abilities to build the solution relying on IaC for the deployments.
For this assessment, the customer does not have any disaster recovery tooling. It is not required to have one for this assessment. But again, it's your solution, so if you feel comfortable developing as a plus, go for it.
As the item d. mentions, the assessment does not requires RTO/RPO/disaster recovery plan.
As item d. and e., the assessment does not requires monitoring solution for kubernetes. If you feel comfortable developing as a plus, would be very appreciated.
Item-by-item:
There is no specific requirements for the dummy pods to run. Only that each pod must serve it's purpose (example: nodejs must be a nodejs pod...). As the assessment says, there is no need to develop applications for this, the purpose is to verify the kubernetes skills and structure of your thoughts, not developer skills on nodejs level. Of course, remember the kubernetes best practices when developing your deployments.
There is no SLA.
As normal web users. If a page shows errors or takes 30 minutes to load, something is wrong.
There is no list of past incidents over this. Since this is a dummy customer requesting a move from their dummy current environment towards your solution that fits best their description.
No. This dummy customer requires your thoughts and guidance to improve his scenario, based on best practices focused on kubernetes. You are the one that the dummy customer is asking about compliance with best practices.
"budget Cost optimization should be applied when necessary, even if a few application related modifications are necessary. Environment isolation is important, but some shared services would be acceptable if they result in major cost reduction."
The above part of the text explains that, if you believe that the solution is getting too expensive (your assumption on how much would be expensive), then you are totally free to change the architecture of the application topology. Example: If the customer has a database, and this database requires too much from the kubernetes cluster, you can use Azure platform as a service components to lower costs.
"Definition of major cost reduction" - If a database in your kubernetes cluster is requiring machines/nodes that costs 3.000 euros per month and the azure paas component costs 500 euros per month, and both will achieve the same functionality. Better leaving the kubernetes cluster for the applications and building the database as an azure paas component, correct ?
Item-by-item:
The vendor is you. You are the vendor providing the migration support, architecture, guidance, consultancy, and developing it. No sales/operational processes involved.
There are no planned changes. You, as the vendor, could come up with a roadmap for this migration.

