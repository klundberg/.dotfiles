# Defined in - @ line 1
function dcstop --description 'alias dcstop=docker-compose stop'
	docker-compose stop $argv;
end
