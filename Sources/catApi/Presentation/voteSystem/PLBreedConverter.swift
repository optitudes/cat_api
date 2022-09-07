class PLBreedConverter {

    static func parsePLVotationBreed(bLBreed: BLBreed)->PLVotationBreed {
        var pLVotationBreed = PLVotationBreed()

        pLVotationBreed.id = bLBreed.id
        pLVotationBreed.name = bLBreed.name
        pLVotationBreed.temperament = bLBreed.temperament
        pLVotationBreed.origin = bLBreed.origin
        
        return pLVotationBreed
    }
    static func parsePLDescriptionBreed(bLBreed: BLBreed)->PLDescriptionBreed {
        var pLDescriptionBreed = PLDescriptionBreed()

        pLDescriptionBreed.id = bLBreed.id
        pLDescriptionBreed.name = bLBreed.name
        pLDescriptionBreed.description = bLBreed.description

        return pLDescriptionBreed
    }

    static func parsePLScoreBreed(bLBreed: BLBreed)-> PLScoreBreed{
        var pLScoreBreed = PLScoreBreed()

        pLScoreBreed.id = bLBreed.id
        pLScoreBreed.name = bLBreed.name
        return pLScoreBreed
    }
}