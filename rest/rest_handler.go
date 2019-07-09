package rest

import (
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"patrongg/rest/endpoints"
)

//Sets up the routing for all endpoints
func Setup() {
	router := mux.NewRouter().StrictSlash(true)
	router.HandleFunc("/api/heros", endpoints.GetHeros).Methods("GET")
	router.HandleFunc("/api/heros/{id}", endpoints.GetHero).Methods("GET")
	router.HandleFunc("/api/heros/{id}/abilities", endpoints.GetHeroAbilities).Methods("GET")
	router.HandleFunc("/api/abilities/", endpoints.GetAllAbilities).Methods("GET")
	router.HandleFunc("/api/abilities/{ability_id}", endpoints.GetAbilityDetails).Methods("GET")
	log.Fatal(http.ListenAndServe(":9000", router))
}