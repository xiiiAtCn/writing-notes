def binding_elsewhere
    x = 20
    return binding
end

remote_binding = binding_elsewhere

x = 10
eval('puts x')
eval('puts x', remote_binding)