package unit_tests

import (
	"patrongg/database"
	"testing"
)

func TestGetAbilityDetails(t *testing.T) {
	abilityDetails, err := database.GetAbilityDetails(4)

	if err != nil {
		t.Error("Error occured during testing")
	}

	if abilityDetails.IsUltimate == false {
		t.Error("Ability isn't an ultimate. Expected the ability to be ultimate")
	}
}
