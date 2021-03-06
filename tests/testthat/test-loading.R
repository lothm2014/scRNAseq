# This checks through all of the getter functions.
# Note that we don't re-run any of the code in the Examples.
# library(testthat); library(scRNAseq); source("test-loading.R")

CHECK <- function(sce) {
    expect_true(all(dim(sce) > 0))
    expect_true(length(assayNames(sce)) > 0)
}

test_that("BaronPancreasData works", {
    CHECK(BaronPancreasData(ensembl=TRUE))
    CHECK(BaronPancreasData("mouse", ensembl=TRUE))
})

test_that("BuettnerESCData works", {
    out <- BuettnerESCData()
    CHECK(out)

    out <- BuettnerESCData(remove.htseq=FALSE)
    CHECK(out)
    expect_s4_class(rowRanges(out), "GRangesList")
})

test_that("CampbellBrainData works", {
    CHECK(CampbellBrainData(ensembl=TRUE))
})

test_that("ChenBrainData works", {
    CHECK(ChenBrainData(ensembl=TRUE))
})

test_that("GrunHSCData works", {
    CHECK(GrunHSCData(ensembl=TRUE))
})

test_that("GrunPancreasData works", {
    CHECK(GrunPancreasData(ensembl=TRUE))
})

test_that("HermannSpermatogenesisData works", {
    CHECK(HermannSpermatogenesisData())
})

test_that("KolodziejczykESCData works", {
    out <- KolodziejczykESCData()
    CHECK(out)

    out <- KolodziejczykESCData(remove.htseq=FALSE)
    CHECK(out)
    expect_s4_class(rowRanges(out), "GRangesList")
})

test_that("LaMannoBrainData works", {
    CHECK(LaMannoBrainData(ensembl=TRUE, "human-es"))
    CHECK(LaMannoBrainData(ensembl=TRUE, "human-embryo"))
    CHECK(LaMannoBrainData(ensembl=TRUE, "human-ips"))
    CHECK(LaMannoBrainData(ensembl=TRUE, "mouse-adult"))
    CHECK(LaMannoBrainData(ensembl=TRUE, "mouse-embryo"))
})

test_that("LunSpikeInData works", {
    out <- LunSpikeInData()
    CHECK(out)
    expect_s4_class(rowRanges(out), "GRangesList")

    out <- LunSpikeInData(split.oncogene=TRUE)
    expect_true("oncogene" %in% altExpNames(out))
    CHECK(out)

    CHECK(LunSpikeInData("tropho"))
})

test_that("MacoskoRetinaData works", {
    CHECK(MacoskoRetinaData(ensembl=TRUE))
})

test_that("MarquesBrainData works", {
    CHECK(MarquesBrainData(ensembl=TRUE))
})

test_that("MuraroPancreasData works", {
    CHECK(MuraroPancreasData(ensembl=TRUE))
})

test_that("NestorowaHSCData works", {
    CHECK(NestorowaHSCData(remove.htseq=FALSE))
})

test_that("PaulHSCData works", {
    CHECK(PaulHSCData(ensembl=TRUE))
    CHECK(PaulHSCData(discard.multiple=FALSE))
})

test_that("Reprocessed*Data works", {
    CHECK(ReprocessedAllenData(assays="tophat_counts", ensembl=TRUE))
    CHECK(ReprocessedTh2Data(assays="tophat_counts", ensembl=TRUE))
    CHECK(ReprocessedFluidigmData(assays="tophat_counts", ensembl=TRUE))
})

test_that("RomanovBrainData works", {
    CHECK(RomanovBrainData(ensembl=TRUE))
})

test_that("SegerstolpePancreasData works", {
    CHECK(SegerstolpePancreasData(ensembl=TRUE))
})

test_that("ShekharRetinaData works", {
    CHECK(ShekharRetinaData(ensembl=TRUE))
})

test_that("TasicBrainData works", {
    CHECK(TasicBrainData(ensembl=TRUE))
})

test_that("UsoskinBrainData works", {
    CHECK(UsoskinBrainData(ensembl=TRUE))
})

test_that("XinPancreasData works", {
    CHECK(XinPancreasData(ensembl=TRUE))
})

test_that("ZeiselBrainData works", {
    CHECK(ZeiselBrainData(ensembl=TRUE))
})

test_that("ZilionisBrianData works", {
    CHECK(ZilionisLungData(ensembl=TRUE))

    CHECK(ZilionisLungData("mouse", ensembl=TRUE))
})

test_that("HermannSpermatogenesisData works", {
    CHECK(HermannSpermatogenesisData(strip=TRUE, location=TRUE))
})

test_that("ERCCSpikeInConcentrations works", {
    table <- ERCCSpikeInConcentrations()
    expect_s4_class(table, "DFrame")
})
