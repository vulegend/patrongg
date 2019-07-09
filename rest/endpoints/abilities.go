package endpoints

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"net/http"
	"patrongg/database"
	"strconv"
)

//Returns the details of an ability with given ID
func GetAbilityDetails(w http.ResponseWriter, r *http.Request) {
	requestPayload := mux.Vars(r)
	abilityID, err := strconv.Atoi(requestPayload["ability_id"])

	if err != nil {
		http.Error(w, "Ability ID must be a whole number", http.StatusBadRequest)
		return
	}

	abilityDetails, err := database.GetAbilityDetails(abilityID)

	if err != nil {
		http.Error(w, "Ability with that ID is not found", http.StatusBadRequest)
	}

	json.NewEncoder(w).Encode(abilityDetails)
}

//Returns all the abilities from local database
func GetAllAbilities(w http.ResponseWriter, r *http.Request) {
	abilities, err := database.GetAllAbilities()

	if err != nil {
		http.Error(w, "Internal server error, please try again", http.StatusInternalServerError)
	}

	json.NewEncoder(w).Encode(abilities)
}
