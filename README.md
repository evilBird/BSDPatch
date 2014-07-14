BSDPatch
========
Who:
NA

What:
An experimental patch-based approach to programming for iOS. Inspired by the signal processing language Pure Data.

Why:
Just cuz.

When:
Whenever.

How: 
The basic unit of BSDPatch is the BSDObject class, which is subclassed to perform a specific calculation. To
subclass, you must override the -calculateOutputValue method. Optionally you may override the -setupWithArguments
method to configure your subclass.

By default, each instance of BSDObject is configured with 1 'hot' inlet, 1 'cold' inlet, and a main outlet. 
Setting the hot inlet value causes the instance to immediately perform its -calculateOutputValue method and send the
result to the main outlet. Setting the cold inlet value simply stores the value for use when the hot inlet value 
changes. Additional inlets and outlets (ports) can be added by overriding the -setupWithArguments: method. Additional
ports are added to the appropriate collections (instances of NSMutableDictionary), so you must specify a name for
the port when you add it. 

Check out the example project, which uses the BSDDistance class to calculate the distance in points between 
arbitrary coordinates in a view. Take a peek at BSDDistance.m to get an idea of how to build your subclass -- 
particularly, the use of other BSDObjects to perform calculations within the -calculateOutputValue method.
