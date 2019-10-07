# Defined in - @ line 1
function dcdu --description 'alias dcdu=docker-compose down; and docker-compose up'
	docker-compose down; and docker-compose up $argv;
end
