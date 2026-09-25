#!/bin/bash


die() {
	CODE=$1
	shift
	>&2 echo $*
	exit $CODE
}

# Check Unity Engine
if [ ! -f "Unity-2022.3.60f1.tar.xz" ]; then
	die 1 Unity version not found! Install it from the previous step. Make sure the name is Unity-2022.3.60f1.tar.xz
fi
echo "Extracting linux64_player_nondevelopment_mono from Unity-2022.3.60f1.tar.xz"
tar -xJf "Unity-2022.3.60f1.tar.xz"  Editor/Data/PlaybackEngines/LinuxStandaloneSupport/Variations/linux64_player_nondevelopment_mono


if [ -d "Editor/Data/PlaybackEngines/LinuxStandaloneSupport/Variations/linux64_player_nondevelopment_mono" ]; then
	mv BoplBattle_Data Data
	cp -r Editor/Data/PlaybackEngines/LinuxStandaloneSupport/Variations/linux64_player_nondevelopment_mono/* . || die 2 Could not copy Unity Engine files
	mv Data BoplBattle_Data
	echo "Unity engine files copied."
	echo "Deleting unnecessary files..."
	rm -r MonoBleedingEdge
	rm UnityCrashHandler64.exe
	rm UnityPlayer.dll
	rm BoplBattle_Data/Plugins/x86_64/steam_api64.dll
	mv LinuxPlayer BoplBattle.x86_64
	rm *_s.debug
	rm -r Editor
	rm BoplBattle_Data/Managed/*.pdb
	echo "Done! You can delete this script if you wish."
fi

