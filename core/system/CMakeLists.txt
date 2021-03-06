#MIT License
#
#Copyright (c) 2016 MTA SZTAKI
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.

# Add all header and cpp files in the directory to the project
set (SOURCES
	ApeSystem.cpp
	)

include_directories(
	${PROJECT_SOURCE_DIR}/core/pluginManager 
	${PROJECT_SOURCE_DIR}/core/eventManager 
	${PROJECT_SOURCE_DIR}/core/systemConfig
	${PROJECT_SOURCE_DIR}/core/mainWindow
	${PROJECT_SOURCE_DIR}/core/scene
	${PROJECT_SOURCE_DIR}/core/scene/session
	${RAKNET_INCLUDE_DIR}	
	)

add_library (ApeSystem SHARED ${SOURCES} )

# Link with dependency libraries
target_link_libraries (ApeSystem ApePluginManager ApeEventManager ApeScene ApeSystemConfig ApeMainWindow RAKNET ws2_32)

# Place target xxx into the specified folder in IDEs supporting it
set_property (TARGET ApeSystem PROPERTY COMPILE_DEFINITIONS BUILDING_APE_SYSTEM_DLL)
set_property (TARGET ApeSystem PROPERTY FOLDER "Core")
