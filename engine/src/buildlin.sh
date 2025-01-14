##
# buildlin.sh
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

gcc -ovegasettings -DCONSOLE ../vegasettings/src/include/central.cpp  ../vegasettings/src/include/file.cpp ../vegasettings/src/include/general.c ../vegasettings/src/c/setup.cpp ../vegasettings/src/include/display_dialog.cpp -I.. -I. -I../launcher  /usr/lib/libdialog.a /usr/lib/libncurses.a  -ldl  /usr/lib/gcc-lib/i386-linux/2.95.4/libstdc++.a /usr/lib/gcc-lib/i386-linux/2.95.4/libgcc.a   -O3

gcc -Xlinker -export-dynamic -Xlinker   -ovegastrike \
 src/cmd/fg_util.o src/cmd/ai/aggressive.o src/cmd/ai/comm_ai.o src/cmd/ai/communication_xml.o src/cmd/ai/communication.o src/cmd/ai/docking.o src/cmd/ai/event_xml.o src/cmd/ai/fire.o src/cmd/ai/fireall.o src/cmd/ai/flybywire.o src/cmd/ai/hard_coded_scripts.o src/cmd/ai/ikarus.o src/cmd/ai/missionscript.o src/cmd/ai/navigation.o src/cmd/ai/order_comm.o src/cmd/ai/order.o src/cmd/ai/script.o src/cmd/ai/tactics.o src/cmd/ai/turretai.o src/cmd/ai/warpto.o src/cmd/alphacurve.o src/cmd/asteroid_generic.o src/gldrv/sdds.o src/cmd/beam_generic.o src/cmd/bolt_generic.o src/cmd/building_generic.o src/cmd/collection.o src/cmd/collide_map.o src/cmd/collide.o src/cmd/container.o src/cmd/csv.o src/cmd/faction_xml.o src/cmd/missile_generic.o src/cmd/mount.o src/cmd/nebula_generic.o src/cmd/planet_generic.o src/cmd/role_bitmask.o src/cmd/unit.o src/cmd/unit_bsp.o src/cmd/unit_collide.o src/cmd/unit_const_cache.o src/cmd/unit_csv.o src/cmd/unit_factory_generic.o src/cmd/unit_functions_generic.o src/cmd/unit_generic.o src/cmd/pilot.o src/cmd/unit_util_generic.o src/cmd/unit_xml.o src/cmd/weapon_xml.o src/cmd/collide2/csgeom2/opbox.o src/cmd/collide2/csgeom2/opmatrix3.o src/cmd/collide2/csgeom2/opvector3.o src/cmd/collide2/OPC_AABBCollider.o src/cmd/collide2/OPC_AABBTree.o src/cmd/collide2/OPC_BaseModel.o src/cmd/collide2/OPC_BoxPruning.o src/cmd/collide2/OPC_Collider.o src/cmd/collide2/OPC_Common.o src/cmd/collide2/OPC_HybridModel.o src/cmd/collide2/OPC_LSSCollider.o src/cmd/collide2/OPC_MeshInterface.o src/cmd/collide2/OPC_Model.o src/cmd/collide2/OPC_OptimizedTree.o src/cmd/collide2/OPC_OBBCollider.o src/cmd/collide2/OPC_Picking.o src/cmd/collide2/OPC_PlanesCollider.o src/cmd/collide2/OPC_RayCollider.o src/cmd/collide2/OPC_SphereCollider.o src/cmd/collide2/OPC_SweepAndPrune.o src/cmd/collide2/OPC_TreeBuilders.o src/cmd/collide2/OPC_TreeCollider.o src/cmd/collide2/OPC_VolumeCollider.o src/cmd/collide2/CSopcodecollider.o src/cmd/collide2/Ice/IceAABB.o src/cmd/collide2/Ice/IceContainer.o src/cmd/collide2/Ice/IceHPoint.o src/cmd/collide2/Ice/IceIndexedTriangle.o src/cmd/collide2/Ice/IceMatrix3x3.o src/cmd/collide2/Ice/IceMatrix4x4.o src/cmd/collide2/Ice/IceOBB.o src/cmd/collide2/Ice/IcePlane.o src/cmd/collide2/Ice/IcePoint.o src/cmd/collide2/Ice/IceRandom.o src/cmd/collide2/Ice/IceRay.o src/cmd/collide2/Ice/IceRevisitedRadix.o src/cmd/collide2/Ice/IceSegment.o src/cmd/collide2/Ice/IceTriangle.o src/cmd/collide2/Ice/IceUtils.o  src/networking/inet_file.o src/networking/inet.o src/python/init.o src/python/python_compile.o src/python/unit_exports.o src/python/unit_exports1.o src/python/unit_exports2.o src/python/unit_exports3.o src/python/unit_method_defs.o src/python/unit_wrapper.o src/python/universe_util_export.o src/configxml.o src/easydom.o src/endianness.o src/macosx_math.o src/faction_generic.o src/faction_util_generic.o src/galaxy_gen.o src/galaxy_xml.o src/galaxy.o src/hashtable.o src/lin_time.o src/load_mission.o src/pk3.o src/posh.o src/savegame.o src/gamemenu.o src/gldrv/gl_program.o src/star_system_generic.o src/star_system_xml.o src/stardate.o src/universe_generic.o src/universe_util_generic.o src/options.o src/vs_globals.o src/vsfilesystem.o src/xml_serializer.o src/xml_support.o src/cmd/script/director_generic.o src/cmd/script/mission_script.o src/cmd/script/mission.o src/cmd/script/msgcenter.o src/cmd/script/pythonmission.o src/cmd/script/script_call_olist.o src/cmd/script/script_call_omap.o src/cmd/script/script_call_order.o src/cmd/script/script_call_string.o src/cmd/script/script_call_unit_generic.o src/cmd/script/script_callbacks.o src/cmd/script/script_expression.o src/cmd/script/script_generic.o src/cmd/script/script_statement.o src/cmd/script/script_util.o src/cmd/script/script_variables.o src/gfx/bounding_box.o src/gfx/bsp.o src/gfx/cockpit_generic.o src/gfx/lerp.o src/gfx/matrix.o src/gfx/mesh_bxm.o src/gfx/mesh_bin.o src/gfx/mesh_poly.o src/gfx/mesh_xml.o src/gfx/mesh.o src/gfx/quaternion.o src/gfx/sphere_generic.o src/gfx/vec.o src/gui/button.o src/gui/control.o src/gui/eventmanager.o src/gui/eventresponder.o src/gui/font.o src/gui/general.o src/gui/glut_support.o src/gui/groupcontrol.o src/gui/guidefs.o src/gui/guitexture.o src/gui/modaldialog.o src/gui/newbutton.o src/gui/painttext.o src/gui/picker.o src/gui/scroller.o src/gui/simplepicker.o src/gui/slider.o src/gui/staticdisplay.o src/gui/text_area.o src/gui/textinputdisplay.o src/gui/window.o src/gui/windowcontroller.o src/networking/accountsxml.o src/networking/client.o src/networking/fileutil.o src/networking/savenet_util.o src/networking/cubicsplines.o src/networking/mangle.o src/networking/netclient_clients.o src/networking/netclient_devices.o src/networking/netclient_login.o src/networking/netclient.o src/networking/netserver_acct.o src/networking/netserver_clients.o src/networking/netserver_devices.o src/networking/netserver_login.o src/networking/netserver_net.o src/networking/netserver.o src/networking/prediction.o src/networking/zonemgr.o src/networking/networkcomm.o src/networking/webcam_support.o src/cg_global.o src/command.o src/config_xml.o src/debug_vs.o src/faction_util.o src/force_feedback.o src/gfxlib_struct.o src/in_joystick.o src/in_kb.o src/in_main.o src/in_mouse.o src/in_sdl.o src/main_loop.o src/physics.o src/rendertext.o src/ship_commands.o src/star_system_jump.o src/star_system.o src/universe_util.o src/universe.o src/gfx/ani_texture.o src/gfx/animation.o src/gfx/aux_logo.o src/gfx/aux_palette.o src/gfx/aux_texture.o src/gfx/background.o src/gfx/camera.o src/gfx/cockpit_xml.o src/gfx/cockpit.o src/gfx/coord_select.o src/gfx/env_map_gent.o src/gfx/gauge.o src/gfx/halo_system.o src/gfx/halo.o src/gfx/hud.o src/gfx/jpeg_memory.o src/gfx/loc_select.o src/gfx/masks.o src/gfx/mesh_fx.o src/gfx/mesh_gfx.o src/gfx/nav/criteria_xml.o src/gfx/nav/criteria.o src/gfx/nav/drawgalaxy.o src/gfx/nav/drawlist.o src/gfx/nav/drawsystem.o src/gfx/nav/navcomputer.o src/gfx/nav/navgetxmldata.o src/gfx/nav/navpath.o src/gfx/nav/navscreen.o src/gfx/nav/navscreenoccupied.o src/gfx/particle.o src/gfx/pipelined_texture.o src/gfx/quadsquare_cull.o src/gfx/quadsquare_render.o src/gfx/quadsquare_update.o src/gfx/quadsquare.o src/gfx/quadtree_xml.o src/gfx/quadtree.o src/gfx/ring.o src/gfx/screenshot.o src/gfx/sphere.o src/gfx/sprite.o src/gfx/star.o src/gfx/stream_texture.o src/gfx/tex_transform.o src/gfx/vdu.o src/gfx/vid_file.o src/gfx/vsbox.o src/gfx/vsimage.o src/gfx/warptrail.o src/aldrv/al_globals.o src/aldrv/al_init.o src/aldrv/al_listen.o src/aldrv/al_sound.o src/cmd/ai/firekeyboard.o src/cmd/ai/flyjoystick.o src/cmd/ai/flykeyboard.o src/cmd/ai/input_dfa.o src/cmd/asteroid.o src/cmd/atmosphere.o src/cmd/base_init.o src/cmd/base_interface.o src/cmd/base_util.o src/cmd/base_write_python.o src/cmd/base_write_xml.o src/cmd/base_xml.o src/cmd/basecomputer.o src/cmd/beam.o src/cmd/bolt.o src/cmd/briefing.o src/cmd/building.o src/cmd/click_list.o src/cmd/cont_terrain.o src/cmd/music.o src/cmd/nebula.o src/cmd/planet.o src/cmd/script/c_alike/c_alike.tab.o src/cmd/script/c_alike/lex.yy.o src/cmd/script/director.o src/cmd/script/flightgroup.o src/cmd/script/script_call_briefing.o src/cmd/script/script_call_unit.o src/cmd/terrain.o src/cmd/unit_factory.o src/cmd/unit_functions.o src/cmd/unit_interface.o src/cmd/unit_util.o src/gldrv/gl_clip.o src/gldrv/gl_fog.o src/gldrv/gl_globals.o src/gldrv/gl_init.o src/gldrv/gl_light_pick.o src/gldrv/gl_light_state.o src/gldrv/gl_light.o src/gldrv/gl_material.o src/gldrv/gl_matrix.o src/gldrv/gl_misc.o src/gldrv/gl_quad_list.o src/gldrv/gl_sphere_list.o src/gldrv/gl_state.o src/gldrv/gl_texture.o src/gldrv/gl_vertex_list.o src/gldrv/winsys.o src/main.o src/python/briefing_wrapper.o libboost_python.a libnetlowlevel.a \
 /usr/lib/libavcodec.a /usr/lib/libavdevice.a /usr/lib/libavformat.a /usr/lib/libavutil.a /usr/lib/libswscale.a /usr/lib/libavcodec.a  /usr/lib/libavutil.a /usr/lib/libglut.a /usr/lib/libexpat.a /usr/lib/libjpeg.a /usr/lib/python2.4/config/libpython2.4.a /usr/lib/libpng.a /usr/lib/libz.a  /usr/lib/libSDL.a /usr/lib/libopenal.a /usr/local/lib/libvorbisfile.a /usr/local/lib/libvorbis.a /usr/local/lib/libvorbisenc.a /usr/local/lib/libogg.a /usr/lib/libGLU.a /usr/lib/libutil.a /usr/lib/gcc-lib/i386-linux/2.95.4/libstdc++.a /usr/lib/libGL.so -ldl -lpthread  /usr/lib/gcc-lib/i386-linux/2.95.4/libgcc.a 
gcc  -DHAVE_SDL -osoundserver src/networking/soundserver.cpp src/networking/softvolume.cpp src/networking/inet.cpp src/networking/inet_file.cpp -I. -Isrc -Isrc/networking  /usr/lib/libSDL_mixer.a /usr/lib/libSDL.a /usr/lib/libsmpeg.a  /usr/lib/libvorbisfile.a /usr/lib/libvorbis.a  /usr/lib/libogg.a -lpthread /usr/lib/libX11.a /usr/lib/libXext.a /usr/lib/libdl.a /usr/lib/gcc-lib/i386-linux/2.95.4/libstdc++.a /usr/lib/gcc-lib/i386-linux/2.95.4/libgcc.a /usr/lib/libm.a
cp soundserver src/networking/
gcc -ovslauncher launcher/saveinterface.cpp launcher/general.cpp src/common/common.cpp `gtk-config --cflags` `glib-config --cflags` -Isrc -I. -Ilauncher  /usr/lib/libgtk.a /usr/lib/libgdk.a /usr/lib/libm.a /usr/lib/libglib.a /usr/lib/libgmodule.a /usr/lib/libX11.a /usr/lib/libXext.a /usr/lib/libXi.a   -ldl  /usr/lib/gcc-lib/i386-linux/2.95.4/libstdc++.a /usr/lib/gcc-lib/i386-linux/2.95.4/libgcc.a 
 cp vslauncher launcher/vslauncher
cp vegasettings ../vegasettings/src/bin/
cp vegasettings ../vegasettings/src/bin/setup


#/usr/lib/gcc-lib/i386-linux/2.95.4/libstdc++.a  /usr/lib/libdl.a   -lpthread
# /usr/lib/gcc-lib/i386-linux/2.95.4/crtbegin.o /usr/lib/gcc-lib/i386-linux/2.95.4/crtend.o 
#-nostartfiles -nostdlib
