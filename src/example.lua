#! /usr/bin/env lua

-- Meta class
Shape = {area = 0}

-- Base class method new

function Shape:new ()
   o = self
   side = 10
   self.area = side*side;
   return o
end

-- Base class method printArea

function Shape:printArea ()
   print("The area is ",self.area)
end

-- Creating an object
myshape = Shape:new()

myshape:printArea()
