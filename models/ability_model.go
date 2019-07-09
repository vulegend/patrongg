package models

type Ability struct {
	ID int `json:"id"`
	Name string `json:"name"`
	Description string `json:"description"`
	IsUltimate bool `json:"is_ultimate"`
	AbilityHero Hero `json:"hero"`
}

type GetAllAbilitiesResponse struct {
	ID int `json:"id"`
	Name string `json:"name"`
}

type GetAbilityDetailsResponse struct {
	ID int `json:"id"`
	Name string `json:"name"`
	Description string `json:"description"`
	IsUltimate bool `json:"is_ultimate"`
	HeroName string `json:"hero"`
}