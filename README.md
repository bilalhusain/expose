view and edit your mongodb collection with backbonejs frontend
---

Assumptions

* mongodb://localhost/db
* /cdn serves json2.js, jquery-min.js, underscore-min.js, backbone-min.js
* application runs at port 2014, and corresponds to location /expose for the reverse proxy
* the list view is paginated with 5 documents per page


Running
* define settings in exposeConfig.coffee
* update schema in db/schema.coffee
* ./build.sh

