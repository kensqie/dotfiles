function up
	set path ''

	for i in (seq 1 $argv[1])
		if [ (pwd) = '/' ]
			return
		end

		cd '../'
	end
end
