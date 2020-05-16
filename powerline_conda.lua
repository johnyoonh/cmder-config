local function get_py_env(env_var)
    env = clink.get_env(env_var)
    if env then
        return env
    end

    return false
end

local function basename(inputstr)
    sep = "\\/"
    local last = nil
    local t={} ; i=1

    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        last = str
    end

    return last
end

local function get_conda_env_filter()
    local env = get_py_env("CONDA_DEFAULT_ENV")

    if env then
        env = basename(env)
        env = addTextWithColor("", env.." ", ansiFgClrYellow, ansiBgClrBlack)
        clink.prompt.value = string.gsub(clink.prompt.value, plc_prompt_lambSymbol, env..plc_prompt_lambSymbol)
    end

    return false
end

clink.prompt.register_filter(get_conda_env_filter, 100)
