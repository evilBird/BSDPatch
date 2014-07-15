BSDPatch
========
OVERVIEW: The basic unit of BSDPatch is the BSDObject class, which is subclassed to perform a specific calculation. Instances of BSDObject subclasses can be used individually, or can be 'chained' by connecting the 'outlet' of an object to the 'inlet' or one or many other objects. It is helpful to think of this configuration as a signal processing chain -- data flows into an object, the object does something with that data, then sends it downstream to any objects to which it is connected. Data flow is generally unidirectional, i.e. input->output, though you may incorporate feedback loops by connecting downstream outlets to upstream inlets within a chain.

To subclass, you must override the -calculateOutputValue method. Optionally you may override the -setupWithArguments: method to configure your subclass.

By default, each instance of BSDObject is configured with 1 'hot' inlet, 1 'cold' inlet, and a main outlet. 
Setting the hot inlet value causes the instance to immediately perform its -calculateOutputValue method and send the
result to the main outlet. Setting the cold inlet value simply stores the value for use when the hot inlet value 
changes. Additional inlets and outlets (ports) can be added by overriding the -setupWithArguments: method. Additional
ports are added to the appropriate collections (instances of NSMutableDictionary), so you must specify a name for
the port when you add it. 

USAGE: Import the BSDPatch folder into your XCode project. Import "BSDPatch.h" to classes where you'd like to use it. If you'd like to use the convenience intializer BSDCreate for your custom subclasses, import your header file to "BSDObjects.h" and add an appropriate class method to BSDCreate.

Check out the example project, which uses the BSDDistance class to calculate the point distance between two
arbitrary coordinates in a view. Take a peek at BSDDistance.m to get an idea of how to build a subclass by chaining instances of other BSDObjects to perform calculations within the -calculateOutputValue method.
