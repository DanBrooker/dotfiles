xcode() {
	# find a workspace and open it
	workspace=`ls */*.xcworkspace | head -1`
	# or find a xcode proj
	project=`ls */*.xcproj | head -1`

	if [ -d $workspace ]
	then
		open $workspace
		exit 0
	fi
	if [ -d $project ]
	then
		open $project
	else
		echo "Couldn't find xcode workspace or project"
	fi
}