input="./init/init.env"

available=/etc/apache2/sites-available
enabled=/etc/apache2/sites-enabled

if [ -d $available ]; then

	if [ -d $enabled ]; then
		rm $enabled/*

		for filename in $available/*.conf; do
  
 	 		while IFS= read -r line
 			do
   				line=$(echo $line | tr "[:upper:]" "[:lower:]")

				case $filename in
				  *$line*)
					echo $line
					echo "it's there!"
					a2ensite $filename
					;;
				esac

  			done < "$input"
		done;
	fi
fi
