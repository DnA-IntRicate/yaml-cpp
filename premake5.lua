-- OUT_DIR and INT_DIR must be defined in the top-most premake file before including this file

project "yaml-cpp"
	language "C++"

	debugdir (OUT_DIR)
    targetdir (OUT_DIR)
    objdir (INT_DIR)

	files
	{
		"include/**.h",
		"src/**.h",
		"src/**.cpp"
	}

	includedirs
	{
		"include"
	}

    filter "system:windows"
		kind "SharedLib"
        systemversion "latest"
        cppdialect "C++11"
		defines
		{
			"yaml_cpp_EXPORTS"
		}

    filter "system:linux"
		kind "StaticLib"
        systemversion "latest"
        cppdialect "gnu++11"
		defines
		{
			"YAML_CPP_STATIC_DEFINE"
		}

    filter "system:macosx"
		kind "StaticLib"
        systemversion "latest"
        cppdialect "gnu++11"
		defines
		{
			"YAML_CPP_STATIC_DEFINE"
		}

	filter "configurations:Debug"
        runtime "Debug"
        symbols "Full"

    filter "configurations:Release"
        runtime "Release"
        symbols "Off"
        optimize "Full"
