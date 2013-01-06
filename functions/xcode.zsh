xcode() {
	# find a workspace and open it
	workspace=`ls | grep xcworkspace | head -1 || echo ""`
	# or find a xcode proj
	project=`ls | grep xcodeproj | head -1 || echo ""`

	if [ -e "$workspace" ]
	then
		`open "$workspace"`
	else
		if [ -e "$project" ]
		then
			`open "$project"`
		else
			echo "Couldn't find xcode workspace or project"
		fi
	fi
	
}