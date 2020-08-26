Publication vers pharo catalog

Catalog is using information downloaded from:
http://catalog.pharo.org/catalog/json

To publish your project:
1. create a metacello ConfigurationOf your project:
ConfigurationOfYourProject class>>catalogDescription
	^ '
	! YourProject 
	I do something blah, blah, blah... 
	
	Project main page: *http://github.com/johndoe/YourProject*'			

ConfigurationOfYourProject class>>catalogContactInfo
	^ 'johndoe@mail.net'

ConfigurationOfYourProject class>>catalogKeywords
	^ #(html fun)


2. upload your configuration to a MetaRepo like:
http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo80/main

Simply opened the Monticello Browser, added the repository:

MCSmalltalkhubRepository
	owner: 'Pharo'
	project: 'MetaRepoForPharo80'
	user: ''
	password: ''

And open it :)



Source:
http://catalog.pharo.org/catalog/note-for-developers?_s=KboJxXbLZ2fw1zoD&_k=uM75wgpxG2HPjbJp
https://pharoweekly.wordpress.com/2017/07/30/how-to-publish-github-managed-project-to-pharo-catalog/


Metacello new
		baseline: 'PharoStartupSettings';
		repository: 'github://rvillemeur/PharoStartupSettings/repository';
		load
		
		
