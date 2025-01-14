##
# intel-mac-link.sh
#
# Vega Strike - Space Simulation, Combat and Trading
# Copyright (C) 2001-2025 The Vega Strike Contributors:
# Project creator: Daniel Horn
# Original development team: As listed in the AUTHORS file
# Current development team: Roy Falk, Benjamen R. Meyer, Stephen G. Tuggy
#
#
# https://github.com/vegastrike/Vega-Strike-Engine-Source
#
# This file is part of Vega Strike.
#
# Vega Strike is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Vega Strike is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Vega Strike.  If not, see <https://www.gnu.org/licenses/>.
#

#blah.o
g++ -g3 -DHAVE_PYTHON=1  -I/Users/danielrh/Vega/include -pipe  -falign-loops=2 -falign-jumps=2 -falign-functions=2  -I/Users/danielrh/Vega//include/SDL -D_GNU_SOURCE=1 -D_THREAD_SAFE -D_REENTRANT -pipe   -o vegaserver  src/cmd/ai/aggressive.o src/cmd/ai/comm_ai.o src/cmd/ai/communication_xml.o src/cmd/ai/communication.o src/cmd/ai/docking.o src/cmd/ai/event_xml.o src/cmd/ai/fire.o src/cmd/ai/fireall.o src/cmd/ai/flybywire.o src/cmd/ai/hard_coded_scripts.o src/cmd/ai/ikarus.o src/cmd/ai/missionscript.o src/cmd/ai/navigation.o src/cmd/ai/order_comm.o src/cmd/ai/order.o src/cmd/ai/script.o src/cmd/ai/tactics.o src/cmd/ai/turretai.o src/cmd/ai/warpto.o src/cmd/alphacurve.o src/cmd/asteroid_generic.o src/cmd/beam_generic.o src/cmd/bolt_generic.o src/cmd/building_generic.o src/cmd/collection.o src/cmd/collide_map.o src/cmd/collide.o src/cmd/container.o src/cmd/csv.o src/cmd/faction_xml.o src/cmd/missile_generic.o src/cmd/mount.o src/cmd/nebula_generic.o src/cmd/planet_generic.o src/cmd/role_bitmask.o src/cmd/unit_bsp.o src/cmd/unit_collide.o src/cmd/unit_const_cache.o src/cmd/unit_csv.o src/cmd/unit_factory_generic.o src/cmd/unit_functions_generic.o src/cmd/unit_generic.o src/cmd/fg_util.o src/cmd/pilot.o src/cmd/unit_util_generic.o src/cmd/unit_xml.o src/cmd/weapon_xml.o src/cmd/collide2/Ice/IceAABB.o src/cmd/collide2/Ice/IceContainer.o src/cmd/collide2/Ice/IceHPoint.o src/cmd/collide2/Ice/IceIndexedTriangle.o src/cmd/collide2/Ice/IceMatrix3x3.o src/cmd/collide2/Ice/IceMatrix4x4.o src/cmd/collide2/Ice/IceOBB.o src/cmd/collide2/Ice/IcePlane.o src/cmd/collide2/Ice/IcePoint.o src/cmd/collide2/Ice/IceRandom.o src/cmd/collide2/Ice/IceRay.o src/cmd/collide2/Ice/IceRevisitedRadix.o src/cmd/collide2/Ice/IceSegment.o src/cmd/collide2/Ice/IceTriangle.o src/cmd/collide2/Ice/IceUtils.o src/cmd/collide2/csgeom2/opbox.o src/cmd/collide2/csgeom2/opmatrix3.o src/cmd/collide2/csgeom2/opvector3.o src/cmd/collide2/OPC_AABBCollider.o src/cmd/collide2/OPC_AABBTree.o src/cmd/collide2/OPC_BaseModel.o src/cmd/collide2/OPC_BoxPruning.o src/cmd/collide2/OPC_Collider.o src/cmd/collide2/OPC_Common.o src/cmd/collide2/OPC_HybridModel.o src/cmd/collide2/OPC_LSSCollider.o src/cmd/collide2/OPC_MeshInterface.o src/cmd/collide2/OPC_Model.o src/cmd/collide2/OPC_OBBCollider.o src/cmd/collide2/OPC_OptimizedTree.o src/cmd/collide2/OPC_Picking.o src/cmd/collide2/OPC_PlanesCollider.o src/cmd/collide2/OPC_RayCollider.o src/cmd/collide2/OPC_SphereCollider.o src/cmd/collide2/OPC_SweepAndPrune.o src/cmd/collide2/OPC_TreeBuilders.o src/cmd/collide2/OPC_TreeCollider.o src/cmd/collide2/OPC_VolumeCollider.o src/cmd/collide2/CSopcodecollider.o src/networking/inet_file.o src/networking/inet.o src/python/init.o src/python/python_compile.o src/python/unit_exports.o src/python/unit_exports1.o src/python/unit_exports2.o src/python/unit_exports3.o src/python/unit_method_defs.o src/python/unit_wrapper.o src/python/universe_util_export.o src/configxml.o src/easydom.o src/endianness.o src/macosx_math.o src/faction_generic.o src/faction_util_generic.o src/galaxy_gen.o src/galaxy_xml.o src/galaxy.o src/hashtable.o src/lin_time.o src/load_mission.o src/pk3.o src/posh.o src/savegame.o src/star_system_generic.o src/star_system_xml.o src/stardate.o src/universe_generic.o src/universe_util_generic.o src/vs_globals.o src/vsfilesystem.o src/xml_serializer.o src/xml_support.o src/options.o src/cmd/script/director_generic.o src/cmd/script/mission_script.o src/cmd/script/mission.o src/cmd/script/msgcenter.o src/cmd/script/pythonmission.o src/cmd/script/script_call_olist.o src/cmd/script/script_call_omap.o src/cmd/script/script_call_order.o src/cmd/script/script_call_string.o src/cmd/script/script_call_unit_generic.o src/cmd/script/script_callbacks.o src/cmd/script/script_expression.o src/cmd/script/script_generic.o src/cmd/script/script_statement.o src/cmd/script/script_util.o src/cmd/script/script_variables.o src/gfx/bounding_box.o src/gfx/bsp.o src/gfx/cockpit_generic.o src/gfx/lerp.o src/gfx/matrix.o src/gfx/mesh_bxm.o src/gfx/mesh_bin.o src/gfx/mesh_poly.o src/gfx/mesh_xml.o src/gfx/mesh.o src/gfx/quaternion.o src/gfx/sphere_generic.o src/gfx/vec.o src/cmd/atmosphere_server.o src/cmd/base_util_server.o src/cmd/beam_server.o src/cmd/bolt_server.o src/cmd/unit_factory_server.o src/cmd/unit_functions_server.o src/cmd/unit_util_server.o src/networking/accountsxml.o src/networking/client.o src/networking/fileutil.o src/networking/savenet_util.o src/networking/cubicsplines.o src/networking/mangle.o src/networking/netclient_clients.o src/networking/netclient_devices.o src/networking/netclient_login.o src/networking/netclient.o src/networking/netserver_acct.o src/networking/netserver_clients.o src/networking/netserver_devices.o src/networking/netserver_login.o src/networking/netserver_net.o src/networking/netserver.o src/networking/prediction.o src/networking/zonemgr.o src/networking/networkcomm_server.o src/faction_util_server.o src/force_feedback_server.o src/gfxlib_struct_server.o src/libaudioserver.o src/libserver.o src/universe_util_server.o  src/cmd/script/flightgroup_server.o src/cmd/script/script_call_unit_server.o src/cmd/script/c_alike/c_alike.tab.o src/cmd/script/c_alike/lex.yy.o src/gfx/sphere_server.o src/gfx/vsbox_server.o src/gfx/mesh_server.o src/gfx/background_server.o src/vegaserver.o src/cmd/script/director_server.o src/gldrv/gl_vertex_list.o src/gldrv/gl_sphere_list_server.o libnetlowlevel.a libboost_python.a -lz -L/Users/danielrh/Vega/lib  -lobjc   -L/Users/danielrh/Vega/lib ../lib/libexpat.a -L/Users/danielrh/Vega/lib ../lib/libpng.a -L/Users/danielrh/Vega/lib ../lib/libjpeg.a  -L/Users/danielrh/Vega/lib  ../Python-2.4.4/libpython2.4.a 
#../lib/libvorbisfile.a ../lib/libvorbis.a ../lib/libogg.a   
#-framework OpenGL -framework GLUT  -Wl,-framework,Cocoa   -framework GLUT
#-L/Users/danielrh/Vega//lib ../lib/libSDLmain.a 
#-framework IOKit -framework Foundation -framework CoreFoundation -framework ApplicationServices -framework CoreServices  -framework Carbon -framework SystemConfiguration -framework CoreAudio -framework AppKit -framework AudioToolbox -framework Quicktime -framework AudioUnit 
#../lib/libopenal.a ../lib/libav*.a ../lib/libswscale.a

/usr/bin/c++  -Xlinker -whyload -Xlinker -whatsloaded -include config.h -pipe -O2 -g -headerpad_max_install_names -fPIC -L/usr/lib "CMakeFiles/vegastrike.dir/src/gui/button.o" "CMakeFiles/vegastrike.dir/src/gui/control.o" "CMakeFiles/vegastrike.dir/src/gui/eventmanager.o" "CMakeFiles/vegastrike.dir/src/gui/eventresponder.o" "CMakeFiles/vegastrike.dir/src/gui/font.o" "CMakeFiles/vegastrike.dir/src/gui/general.o" "CMakeFiles/vegastrike.dir/src/gui/glut_support.o" "CMakeFiles/vegastrike.dir/src/gui/groupcontrol.o" "CMakeFiles/vegastrike.dir/src/gui/guidefs.o" "CMakeFiles/vegastrike.dir/src/gui/guitexture.o" "CMakeFiles/vegastrike.dir/src/gui/modaldialog.o" "CMakeFiles/vegastrike.dir/src/gui/newbutton.o" "CMakeFiles/vegastrike.dir/src/gui/painttext.o" "CMakeFiles/vegastrike.dir/src/gui/picker.o" "CMakeFiles/vegastrike.dir/src/gui/scroller.o" "CMakeFiles/vegastrike.dir/src/gui/simplepicker.o" "CMakeFiles/vegastrike.dir/src/gui/slider.o" "CMakeFiles/vegastrike.dir/src/gui/staticdisplay.o" "CMakeFiles/vegastrike.dir/src/gui/text_area.o" "CMakeFiles/vegastrike.dir/src/gui/textinputdisplay.o" "CMakeFiles/vegastrike.dir/src/gui/window.o" "CMakeFiles/vegastrike.dir/src/gui/windowcontroller.o" "CMakeFiles/vegastrike.dir/src/networking/networkcomm.o" "CMakeFiles/vegastrike.dir/src/networking/webcam_support.o" "CMakeFiles/vegastrike.dir/src/cg_global.o" "CMakeFiles/vegastrike.dir/src/command.o" "CMakeFiles/vegastrike.dir/src/config_xml.o" "CMakeFiles/vegastrike.dir/src/debug_vs.o" "CMakeFiles/vegastrike.dir/src/faction_util.o" "CMakeFiles/vegastrike.dir/src/force_feedback.o" "CMakeFiles/vegastrike.dir/src/gamemenu.o" "CMakeFiles/vegastrike.dir/src/gfxlib_struct.o" "CMakeFiles/vegastrike.dir/src/in_joystick.o" "CMakeFiles/vegastrike.dir/src/in_kb.o" "CMakeFiles/vegastrike.dir/src/in_main.o" "CMakeFiles/vegastrike.dir/src/in_mouse.o" "CMakeFiles/vegastrike.dir/src/in_sdl.o" "CMakeFiles/vegastrike.dir/src/main_loop.o" "CMakeFiles/vegastrike.dir/src/physics.o" "CMakeFiles/vegastrike.dir/src/rendertext.o" "CMakeFiles/vegastrike.dir/src/ship_commands.o" "CMakeFiles/vegastrike.dir/src/star_system_jump.o" "CMakeFiles/vegastrike.dir/src/star_system.o" "CMakeFiles/vegastrike.dir/src/universe_util.o" "CMakeFiles/vegastrike.dir/src/universe.o" "CMakeFiles/vegastrike.dir/src/gfx/ani_texture.o" "CMakeFiles/vegastrike.dir/src/gfx/animation.o" "CMakeFiles/vegastrike.dir/src/gfx/aux_logo.o" "CMakeFiles/vegastrike.dir/src/gfx/aux_palette.o" "CMakeFiles/vegastrike.dir/src/gfx/aux_texture.o" "CMakeFiles/vegastrike.dir/src/gfx/background.o" "CMakeFiles/vegastrike.dir/src/gfx/camera.o" "CMakeFiles/vegastrike.dir/src/gfx/cockpit_xml.o" "CMakeFiles/vegastrike.dir/src/gfx/cockpit.o" "CMakeFiles/vegastrike.dir/src/gfx/coord_select.o" "CMakeFiles/vegastrike.dir/src/gfx/env_map_gent.o" "CMakeFiles/vegastrike.dir/src/gfx/gauge.o" "CMakeFiles/vegastrike.dir/src/gfx/halo_system.o" "CMakeFiles/vegastrike.dir/src/gfx/halo.o" "CMakeFiles/vegastrike.dir/src/gfx/hud.o" "CMakeFiles/vegastrike.dir/src/gfx/jpeg_memory.o" "CMakeFiles/vegastrike.dir/src/gfx/loc_select.o" "CMakeFiles/vegastrike.dir/src/gfx/masks.o" "CMakeFiles/vegastrike.dir/src/gfx/mesh_fx.o" "CMakeFiles/vegastrike.dir/src/gfx/mesh_gfx.o" "CMakeFiles/vegastrike.dir/src/gfx/nav/criteria_xml.o" "CMakeFiles/vegastrike.dir/src/gfx/nav/criteria.o" "CMakeFiles/vegastrike.dir/src/gfx/nav/drawgalaxy.o" "CMakeFiles/vegastrike.dir/src/gfx/nav/drawlist.o" "CMakeFiles/vegastrike.dir/src/gfx/nav/drawsystem.o" "CMakeFiles/vegastrike.dir/src/gfx/nav/navcomputer.o" "CMakeFiles/vegastrike.dir/src/gfx/nav/navgetxmldata.o" "CMakeFiles/vegastrike.dir/src/gfx/nav/navpath.o" "CMakeFiles/vegastrike.dir/src/gfx/nav/navscreen.o" "CMakeFiles/vegastrike.dir/src/gfx/nav/navscreenoccupied.o" "CMakeFiles/vegastrike.dir/src/gfx/particle.o" "CMakeFiles/vegastrike.dir/src/gfx/pipelined_texture.o" "CMakeFiles/vegastrike.dir/src/gfx/quadsquare_cull.o" "CMakeFiles/vegastrike.dir/src/gfx/quadsquare_render.o" "CMakeFiles/vegastrike.dir/src/gfx/quadsquare_update.o" "CMakeFiles/vegastrike.dir/src/gfx/quadsquare.o" "CMakeFiles/vegastrike.dir/src/gfx/quadtree_xml.o" "CMakeFiles/vegastrike.dir/src/gfx/quadtree.o" "CMakeFiles/vegastrike.dir/src/gfx/ring.o" "CMakeFiles/vegastrike.dir/src/gfx/screenshot.o" "CMakeFiles/vegastrike.dir/src/gfx/sphere.o" "CMakeFiles/vegastrike.dir/src/gfx/sprite.o" "CMakeFiles/vegastrike.dir/src/gfx/star.o" "CMakeFiles/vegastrike.dir/src/gfx/stream_texture.o" "CMakeFiles/vegastrike.dir/src/gfx/technique.o" "CMakeFiles/vegastrike.dir/src/gfx/tex_transform.o" "CMakeFiles/vegastrike.dir/src/gfx/vdu.o" "CMakeFiles/vegastrike.dir/src/gfx/vid_file.o" "CMakeFiles/vegastrike.dir/src/ffmpeg_init.o" "CMakeFiles/vegastrike.dir/src/gfx/vsbox.o" "CMakeFiles/vegastrike.dir/src/gfx/vsimage.o" "CMakeFiles/vegastrike.dir/src/gfx/warptrail.o" "CMakeFiles/vegastrike.dir/src/audio/CodecRegistry.o" "CMakeFiles/vegastrike.dir/src/audio/Stream.o" "CMakeFiles/vegastrike.dir/src/audio/Sound.o" "CMakeFiles/vegastrike.dir/src/audio/Source.o" "CMakeFiles/vegastrike.dir/src/audio/SourceTemplate.o" "CMakeFiles/vegastrike.dir/src/audio/SceneManager.o" "CMakeFiles/vegastrike.dir/src/audio/Renderer.o" "CMakeFiles/vegastrike.dir/src/audio/utils.o" "CMakeFiles/vegastrike.dir/src/audio/RenderableSource.o" "CMakeFiles/vegastrike.dir/src/audio/Listener.o" "CMakeFiles/vegastrike.dir/src/audio/Scene.o" "CMakeFiles/vegastrike.dir/src/audio/SimpleSource.o" "CMakeFiles/vegastrike.dir/src/audio/SimpleScene.o" "CMakeFiles/vegastrike.dir/src/audio/codecs/Codec.o" "CMakeFiles/vegastrike.dir/src/audio/codecs/FFStream.o" "CMakeFiles/vegastrike.dir/src/audio/codecs/OggStream.o" "CMakeFiles/vegastrike.dir/src/audio/codecs/OggData.o" "CMakeFiles/vegastrike.dir/src/audio/codecs/OggCodec.o" "CMakeFiles/vegastrike.dir/src/audio/codecs/FFCodec.o" "CMakeFiles/vegastrike.dir/src/aldrv/al_globals.o" "CMakeFiles/vegastrike.dir/src/aldrv/al_init.o" "CMakeFiles/vegastrike.dir/src/aldrv/al_listen.o" "CMakeFiles/vegastrike.dir/src/aldrv/al_sound.o" "CMakeFiles/vegastrike.dir/src/cmd/ai/firekeyboard.o" "CMakeFiles/vegastrike.dir/src/cmd/ai/flyjoystick.o" "CMakeFiles/vegastrike.dir/src/cmd/ai/flykeyboard.o" "CMakeFiles/vegastrike.dir/src/cmd/ai/input_dfa.o" "CMakeFiles/vegastrike.dir/src/cmd/asteroid.o" "CMakeFiles/vegastrike.dir/src/cmd/atmosphere.o" "CMakeFiles/vegastrike.dir/src/cmd/base_init.o" "CMakeFiles/vegastrike.dir/src/cmd/base_interface.o" "CMakeFiles/vegastrike.dir/src/cmd/base_util.o" "CMakeFiles/vegastrike.dir/src/cmd/base_write_python.o" "CMakeFiles/vegastrike.dir/src/cmd/base_write_xml.o" "CMakeFiles/vegastrike.dir/src/cmd/base_xml.o" "CMakeFiles/vegastrike.dir/src/cmd/basecomputer.o" "CMakeFiles/vegastrike.dir/src/cmd/beam.o" "CMakeFiles/vegastrike.dir/src/cmd/bolt.o" "CMakeFiles/vegastrike.dir/src/cmd/briefing.o" "CMakeFiles/vegastrike.dir/src/cmd/building.o" "CMakeFiles/vegastrike.dir/src/cmd/click_list.o" "CMakeFiles/vegastrike.dir/src/cmd/cont_terrain.o" "CMakeFiles/vegastrike.dir/src/cmd/music.o" "CMakeFiles/vegastrike.dir/src/cmd/nebula.o" "CMakeFiles/vegastrike.dir/src/cmd/planet.o" "CMakeFiles/vegastrike.dir/src/cmd/script/c_alike/c_alike.tab.o" "CMakeFiles/vegastrike.dir/src/cmd/script/c_alike/lex.yy.o" "CMakeFiles/vegastrike.dir/src/cmd/script/director.o" "CMakeFiles/vegastrike.dir/src/cmd/script/flightgroup.o" "CMakeFiles/vegastrike.dir/src/cmd/script/script_call_briefing.o" "CMakeFiles/vegastrike.dir/src/cmd/script/script_call_unit.o" "CMakeFiles/vegastrike.dir/src/cmd/terrain.o" "CMakeFiles/vegastrike.dir/src/cmd/unit_factory.o" "CMakeFiles/vegastrike.dir/src/cmd/unit_functions.o" "CMakeFiles/vegastrike.dir/src/cmd/unit_interface.o" "CMakeFiles/vegastrike.dir/src/cmd/unit_util.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_program.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_clip.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_fog.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_globals.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_init.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_light_pick.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_light_state.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_light.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_material.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_matrix.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_misc.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_quad_list.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_sphere_list.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_state.o" "CMakeFiles/vegastrike.dir/src/gldrv/sdds.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_texture.o" "CMakeFiles/vegastrike.dir/src/gldrv/gl_vertex_list.o" "CMakeFiles/vegastrike.dir/src/gldrv/winsys.o" "CMakeFiles/vegastrike.dir/src/main.o" "CMakeFiles/vegastrike.dir/src/python/briefing_wrapper.o"   -o vegastrike  -L/Users/danielrh/Vega/Python-2.4.4 -L/Users/danielrh/Vega/vegastrike/boost/1_33 -L/Users/danielrh/Vega/vegastrike -L/Users/danielrh/Vega/lib -lengine_com -lOPcollide -lnetgeneric -lnetlowlevel -lpython2.4 -lboost_python -framework AGL -framework OpenGL -framework GLUT -framework Cocoa -framework OpenAL -ljpeg -lpng -lSDL -lSDLmain -framework Cocoa -lvorbis -lvorbisfile -logg -lz -lexpat -lm -lavformat -lavdevice -lavfilter -lavutil -lavcodec  -framework QuickTime -framework CoreFoundation -framework ApplicationServices -framework CoreServices -framework SystemConfiguration -framework CoreAudio -framework Quartz -framework Foundation -framework AudioUnit -framework IOKit -framework Cocoa -framework Carbon >&errlog2
#g++ -g3 -DHAVE_PYTHON=1  -I/Users/danielrh/Vega/include -pipe  -falign-loops=2 -falign-jumps=2 -falign-functions=2  -I/Users/danielrh/Vega//include/SDL -D_GNU_SOURCE=1 -D_THREAD_SAFE -D_REENTRANT -pipe   -o vegastrike src/cmd/collide2/*.o src/cmd/collide2/Ice/*.o src/cmd/collide2/csgeom2/*.o src/cmd/ai/aggressive.o src/cmd/ai/comm_ai.o src/cmd/ai/communication_xml.o src/cmd/ai/communication.o src/cmd/ai/docking.o src/cmd/ai/event_xml.o src/cmd/ai/fire.o src/cmd/ai/fireall.o src/cmd/ai/flybywire.o src/cmd/ai/hard_coded_scripts.o src/cmd/ai/ikarus.o src/cmd/ai/missionscript.o src/cmd/ai/navigation.o src/cmd/ai/order_comm.o src/cmd/ai/order.o src/cmd/ai/script.o src/cmd/ai/tactics.o src/cmd/ai/turretai.o src/cmd/ai/warpto.o src/cmd/alphacurve.o src/cmd/asteroid_generic.o src/cmd/fg_util.o src/cmd/beam_generic.o src/cmd/bolt_generic.o src/cmd/building_generic.o src/cmd/collection.o src/cmd/collide_map.o src/cmd/collide.o src/cmd/container.o src/cmd/csv.o src/cmd/faction_xml.o src/cmd/missile_generic.o src/cmd/mount.o src/cmd/nebula_generic.o src/cmd/planet_generic.o src/cmd/role_bitmask.o src/cmd/unit_bsp.o src/cmd/unit_collide.o src/cmd/unit_const_cache.o src/cmd/unit_csv.o src/cmd/unit_factory_generic.o src/cmd/unit_functions_generic.o src/cmd/unit_generic.o src/cmd/pilot.o src/cmd/unit_util_generic.o src/cmd/unit_xml.o src/cmd/weapon_xml.o src/networking/inet_file.o src/networking/inet.o src/python/init.o src/python/python_compile.o src/python/unit_exports.o src/python/unit_exports1.o src/python/unit_exports2.o src/python/unit_exports3.o src/python/unit_method_defs.o src/python/unit_wrapper.o src/python/universe_util_export.o src/configxml.o src/easydom.o src/endianness.o src/macosx_math.o src/faction_generic.o src/faction_util_generic.o src/galaxy_gen.o src/galaxy_xml.o src/galaxy.o src/hashtable.o src/lin_time.o src/load_mission.o src/pk3.o src/posh.o src/savegame.o src/gamemenu.o src/star_system_generic.o src/star_system_xml.o src/stardate.o src/universe_generic.o src/universe_util_generic.o src/vs_globals.o src/vsfilesystem.o src/xml_serializer.o src/xml_support.o src/cmd/script/director_generic.o src/cmd/script/mission_script.o src/cmd/script/mission.o src/cmd/script/msgcenter.o src/cmd/script/pythonmission.o src/cmd/script/script_call_olist.o src/cmd/script/script_call_omap.o src/cmd/script/script_call_order.o src/cmd/script/script_call_string.o src/cmd/script/script_call_unit_generic.o src/cmd/script/script_callbacks.o src/cmd/script/script_expression.o src/cmd/script/script_generic.o src/cmd/script/script_statement.o src/cmd/script/script_util.o src/cmd/script/script_variables.o src/gfx/bounding_box.o src/gfx/bsp.o src/gfx/cockpit_generic.o src/gfx/lerp.o src/gfx/matrix.o src/gfx/mesh_bxm.o src/gfx/mesh_bin.o src/gfx/mesh_poly.o src/gfx/mesh_xml.o src/gfx/mesh.o src/gfx/quaternion.o src/gfx/sphere_generic.o src/gfx/vec.o src/gui/button.o src/gui/control.o src/gui/eventmanager.o src/gui/eventresponder.o src/gui/font.o src/gui/general.o src/gui/glut_support.o src/gui/groupcontrol.o src/gui/guidefs.o src/gui/guitexture.o src/gui/modaldialog.o src/gui/newbutton.o src/gui/painttext.o src/gui/picker.o src/gui/scroller.o src/gui/simplepicker.o src/gui/slider.o src/gui/staticdisplay.o src/gui/text_area.o src/gui/textinputdisplay.o src/gui/window.o src/gui/windowcontroller.o src/networking/accountsxml.o src/networking/client.o src/networking/fileutil.o src/networking/savenet_util.o src/networking/cubicsplines.o src/networking/mangle.o src/networking/netclient_clients.o src/networking/netclient_devices.o src/networking/netclient_login.o src/networking/netclient.o src/networking/netserver_acct.o src/networking/netserver_clients.o src/networking/netserver_devices.o src/networking/netserver_login.o src/networking/netserver_net.o src/networking/netserver.o src/networking/prediction.o src/networking/zonemgr.o src/networking/networkcomm.o src/networking/webcam_support.o src/cg_global.o src/command.o src/config_xml.o src/debug_vs.o src/faction_util.o src/force_feedback.o src/gfxlib_struct.o src/in_joystick.o src/in_kb.o src/in_main.o src/in_mouse.o src/in_sdl.o src/main_loop.o src/physics.o src/rendertext.o src/ship_commands.o src/star_system_jump.o src/star_system.o src/universe_util.o src/universe.o src/gfx/ani_texture.o src/gfx/animation.o src/gfx/aux_logo.o src/gfx/aux_palette.o src/gfx/aux_texture.o src/gfx/background.o src/gfx/camera.o src/gfx/cockpit_xml.o src/gfx/cockpit.o src/gfx/coord_select.o src/gfx/env_map_gent.o src/gfx/gauge.o src/gfx/halo_system.o src/gfx/halo.o src/gfx/hud.o src/gfx/jpeg_memory.o src/gfx/loc_select.o src/gfx/masks.o src/gfx/mesh_fx.o src/gfx/mesh_gfx.o src/gfx/nav/criteria_xml.o src/gfx/nav/criteria.o src/gfx/nav/drawgalaxy.o src/gfx/nav/drawlist.o src/gfx/nav/drawsystem.o src/gfx/nav/navcomputer.o src/gfx/nav/navgetxmldata.o src/gfx/nav/navpath.o src/gfx/nav/navscreen.o src/gfx/nav/navscreenoccupied.o src/gfx/particle.o src/gfx/pipelined_texture.o src/gfx/quadsquare_cull.o src/gfx/quadsquare_render.o src/gfx/quadsquare_update.o src/gfx/quadsquare.o src/gfx/quadtree_xml.o src/gfx/quadtree.o src/gfx/ring.o src/gfx/screenshot.o src/gfx/sphere.o src/gfx/sprite.o src/gfx/star.o src/gfx/stream_texture.o src/gfx/tex_transform.o src/gfx/vdu.o src/gfx/vsbox.o src/gfx/vsimage.o src/gfx/warptrail.o src/aldrv/al_globals.o src/aldrv/al_init.o src/aldrv/al_listen.o src/aldrv/al_sound.o src/cmd/ai/firekeyboard.o src/cmd/ai/flyjoystick.o src/cmd/ai/flykeyboard.o src/cmd/ai/input_dfa.o src/cmd/asteroid.o src/cmd/atmosphere.o src/cmd/base_init.o src/cmd/base_interface.o src/cmd/base_util.o src/cmd/base_write_python.o src/cmd/base_write_xml.o src/cmd/base_xml.o src/cmd/basecomputer.o src/cmd/beam.o src/cmd/bolt.o src/cmd/briefing.o src/cmd/building.o src/cmd/click_list.o src/cmd/cont_terrain.o src/cmd/music.o src/cmd/nebula.o src/cmd/planet.o src/cmd/script/c_alike/c_alike.tab.o src/cmd/script/c_alike/lex.yy.o src/cmd/script/director.o src/cmd/script/flightgroup.o src/cmd/script/script_call_briefing.o src/cmd/script/script_call_unit.o src/cmd/terrain.o src/cmd/unit_factory.o src/cmd/unit_functions.o src/cmd/unit_interface.o src/cmd/unit_util.o src/gldrv/gl_clip.o src/gldrv/sdds.o src/gldrv/gl_fog.o src/gldrv/gl_globals.o src/gldrv/gl_init.o src/gldrv/gl_light_pick.o src/gldrv/gl_light_state.o src/gldrv/gl_light.o src/gldrv/gl_material.o src/gldrv/gl_matrix.o src/gldrv/gl_misc.o src/gldrv/gl_quad_list.o src/gldrv/gl_sphere_list.o src/gldrv/gl_state.o src/gldrv/gl_program.o src/gldrv/gl_texture.o src/gldrv/gl_vertex_list.o src/gldrv/winsys.o src/main.o src/python/briefing_wrapper.o src/options.o src/gfx/vid_file.o libboost_python.a libnetlowlevel.a  -lz -L/Users/danielrh/Vega/lib ../lib/libvorbisfile.a ../lib/libvorbis.a ../lib/libogg.a    -framework OpenGL -framework GLUT  -lobjc -L/Users/danielrh/Vega//lib ../lib/libSDL.a ../lib/libSDLmain.a  -Wl,-framework,Cocoa   -framework GLUT -L/Users/danielrh/Vega/lib ../lib/libexpat.a -L/Users/danielrh/Vega/lib ../lib/libpng.a -L/Users/danielrh/Vega/lib ../lib/libjpeg.a  -L/Users/danielrh/Vega/lib  ../Python-2.4.4/libpython2.4.a -framework IOKit -framework Foundation -framework CoreFoundation -framework ApplicationServices -framework CoreServices  -framework Carbon -framework SystemConfiguration -framework CoreAudio -framework AppKit -framework AudioToolbox -framework Quicktime -framework AudioUnit ../lib/libopenal.a ../lib/libav*.a ../lib/libswscale.a
# -framework SDL





#-framework OpenAL
#
g++  -I/Developer/SDKs/MacOSX10.2.8sdk/System/Library/Frameworks/Carbon.framework/Libraries/CIncludes -DHAVE_PYTHON=1 -I/Users/danielrh/Vega/Python-2.4.4/Include  -pipe  -O2 -ffast-math  -I/Users/danielrh/Vega//include/SDL -D_GNU_SOURCE=1 -D_THREAD_SAFE -D_REENTRANT   -o mesher /Users/danielrh/Vega/lib/libvorbisfile.a /Users/danielrh/Vega/lib/libvorbis.a /Users/danielrh/Vega/lib/libogg.a /Users/danielrh/Vega/lib/libSDL.a  -framework AppKit   -framework Quicktime -framework AudioUnit -framework AudioToolbox -framework OpenGL -framework ApplicationServices  objconv/mesher/mesher-converter.o objconv/mesher/mesher-from_BFXM.o objconv/mesher/mesher-from_obj.o objconv/mesher/mesher-to_BFXM.o objconv/mesher/mesher-to_obj.o src/mesher-hashtable.o src/mesher-xml_support.o  ../lib/libexpat.a
gcc -Xlinker -Y -Xlinker 16384 -Xlinker -force_flat_namespace  -Xlinker -nomultidefs  -o soundserver -DHAVE_SDL=1 -D__APPLE -I/Users/danielrh/Vega/include -I.. src/networking/soundserver.cpp src/networking/inet.cpp -I. src/lin_time.cpp src/networking/inet_file.cpp  -I/sw/include /Users/danielrh/Vega/lib/libSDL_mixer.a /Users/danielrh/Vega/lib/libvorbisfile.a /Users/danielrh/Vega/lib/libvorbis.a /Users/danielrh/Vega/lib/libogg.a /Users/danielrh/Vega/lib/libSDL.a  -framework AppKit   -framework Quicktime -framework AudioUnit -framework AudioToolbox -framework OpenGL -framework ApplicationServices src/networking/softvolume.cpp -lz -L/Users/danielrh/Vega/lib ../lib/libvorbisfile.a ../lib/libvorbis.a ../lib/libogg.a  -Wl,-framework,Cocoa   -framework GLUT -L/Users/danielrh/Vega/lib ../lib/libexpat.a -L/Users/danielrh/Vega/lib ../lib/libpng.a -L/Users/danielrh/Vega/lib ../lib/libjpeg.a  
gcc -Xlinker -Y -Xlinker 16384 -Xlinker -force_flat_namespace  -Xlinker -nomultidefs  -o soundserver -DHAVE_SDL=1 -D__APPLE -I/Users/danielrh/Vega/include -I.. src/networking/soundserver.cpp src/networking/inet.cpp -I. src/lin_time.cpp src/networking/inet_file.cpp  -I/sw/include /Users/danielrh/Vega/lib/libSDL_mixer.a /Users/danielrh/Vega/lib/libvorbisfile.a /Users/danielrh/Vega/lib/libvorbis.a /Users/danielrh/Vega/lib/libogg.a /Users/danielrh/Vega/lib/libSDL.a  -framework AppKit   -framework Quicktime -framework AudioUnit -framework AudioToolbox -framework OpenGL -framework ApplicationServices src/networking/softvolume.cpp -lz -L/Users/danielrh/Vega/lib ../lib/libvorbisfile.a ../lib/libvorbis.a ../lib/libogg.a  -Wl,-framework,Cocoa   -framework GLUT -L/Users/danielrh/Vega/lib ../lib/libexpat.a -L/Users/danielrh/Vega/lib ../lib/libpng.a -L/Users/danielrh/Vega/lib ../lib/libjpeg.a  
install_name_tool  -change /System/Library/Frameworks/OpenAL.framework/Versions/A/OpenAL @executable_path/../Frameworks/OpenAL.framework/Versions/A/OpenAL vegastrike
install_name_tool  -change /Library/Frameworks/SDL.framework/Versions/A/SDL @executable_path/../Frameworks/SDL.framework/Versions/A/SDL vegastrike