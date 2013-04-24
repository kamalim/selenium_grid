selenium_grid
=============

This is a selenium grid 2 (2.31) setup using Vagrant and chef-solo.The grid comprises of :

Hub (A centos 6.3 vm)

linux node (Ubuntu desktop 12.10)

windows node (windows 7).

Please edit the id_rsa file local in the Vagrantfile with respect to your local dev box.

Once you clone the project proceed as below:

$cd selenium_grid

$vagrant up

This will setup a selenium grid with the following browser options:

Firefox

Chrome

IE

If you face any issue please email me @kamalika.mj@gmail.com
