sinatra_assetpack_demo
======================

Demo sinatra app for AssetPack

Using [sinatra-assetpack][] in a minimal [sinatra][] application. 

Assets such as images, CSS and Javascript are often considered to be static
and for faster page load times are given rather long cache times. An Asset 
manager will append a code or number to the file when the contents of the file
changes the number will be updated. Allowing developers to work with fixed name
files ie screen.css, and browsers to use long cache time for the file screen.css.789.

This means that as soon as new assets (CSS, Javascript) content is pushed to the web
server the user will see the updates.

[sinatra-assetpack]: http://ricostacruz.com/sinatra-assetpack
[sinatra]: http://www.sinatrarb.com/ 
