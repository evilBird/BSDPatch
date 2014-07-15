BSDPatch
========
An experimental patch-based approach to programming for iOS. Inspired by the signal processing language Pure Data.

The basic unit of BSDPatch is the BSDObject class, which is subclassed to perform a specific calculation. BSDObject
subclasses can be used singly or 'chained' by connecting the 'outlet' of an object to the 'inlet' or one or many other objects. It is helpful to think of this configuration as a signal processing chain -- data flows into an object, the object does something with that data, then sends it downstream. 

To subclass, you must override the -calculateOutputValue method. Optionally you may override the -setupWithArguments: method to configure your subclass.

By default, each instance of BSDObject is configured with 1 'hot' inlet, 1 'cold' inlet, and a main outlet. 
Setting the hot inlet value causes the instance to immediately perform its -calculateOutputValue method and send the
result to the main outlet. Setting the cold inlet value simply stores the value for use when the hot inlet value 
changes. Additional inlets and outlets (ports) can be added by overriding the -setupWithArguments: method. Additional
ports are added to the appropriate collections (instances of NSMutableDictionary), so you must specify a name for
the port when you add it. 

Check out the example project, which uses the BSDDistance class to calculate the point distance between two
arbitrary coordinates in a view. Take a peek at BSDDistance.m to get an idea of how to build a subclass by chaining instances of other BSDObjects to perform calculations within the -calculateOutputValue method.
