ruby-PACgen
===========

If you use PAC files for your Proxy settings and have multiple similar PAC files, this script may help you. jsmin.rb will also minify your PAC files, for smaller download sizes.

Edit the proxy_generation.rb file to include the correct configurations, including the names of the files, the proxy addresses, and the location where you want the PAC files to be generated.

Edit the proxy.erb template to have the correct rules for your PAC files.

Run the script to generate the PAC files
<code>
ruby proxy_generation.rb
</code>

License
=======

Copyright (c) 2010 Daniel Westendorf

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
