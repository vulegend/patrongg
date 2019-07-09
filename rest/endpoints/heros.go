package endpoints

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"net/http"
	"patrongg/database"
	"strconv"
)

//Returns all abilities for a given hero ID
func GetHeroAbilities(w http.ResponseWriter, r *http.Request) {
	requestPayload := mux.Vars(r)
	heroID, err := strconv.Atoi(requestPayload["id"])

	if err != nil {
		http.Error(w, "Hero ID must be a whole number", http.StatusBadRequest)
		return
	}

	abilities, err := database.GetHeroAbilities(heroID)

	if err != nil {
		http.Error(w, "Hero with that ID not found", http.StatusNotFound)
	}

	json.NewEncoder(w).Encode(abilities)
}

//Returns all the heroes from the local database
func GetHeros(w http.ResponseWriter, r *http.Request) {
	heroes, err := database.GetHeroes()

	if err != nil {
		http.Error(w, "Internal server error, try again later", http.StatusInternalServerError)
	}

	json.NewEncoder(w).Encode(heroes)
}

//Returns the details of a single hero with a given ID
func GetHero(w http.ResponseWriter, r *http.Request) {
	requestPayload := mux.Vars(r)
	heroID, err := strconv.Atoi(requestPayload["id"])

	if err != nil {
		http.Error(w, "Hero ID must be a whole number", http.StatusBadRequest)
		return
	}

	hero, err := database.GetHero(heroID)

	if err != nil {
		http.Error(w, err.Error(), http.StatusNotFound)
		return
	}

	json.NewEncoder(w).Encode(hero)
}