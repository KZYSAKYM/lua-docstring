require("help")


a = help.docstring[[This is an example]] .. function()
	print("this is the function")
	return "function return value"
end

print("Before calling a")
print(a())

print("before calling help a")
help(a)

print("before defining b")

--docstring[[a second documented func]] ..
function b()
	print("this is the second function")
end

help.docstring[[a second documented func]].applyTo(b)

help(b)

print("before defining random")
random =
	help.docstring[[Compute random number.]] ..
	help.docstring[[An extra docstring.]] ..
	function(n)
		return math.random(n)
	end

print("before printing random")
print(random)

print("before printing results of random call")
print(random(5))

print("before help(random)")
help(random)


help(help, help.docstring)

if osgLua then
	print("We have osgLua")
	help(osg.PositionAttitudeTransform())
	local xform = help.docstring[[The root transform.]] .. osg.PositionAttitudeTransform()
	help(xform)
end

help.html.writeFile("help.htm",
	help.html.documentRecursive("help", help)
)
