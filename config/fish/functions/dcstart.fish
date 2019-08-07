# Defined in - @ line 1
function dcstart --description 'alias dcstart=docker-compose start'
	docker-compose start $argv;
end
