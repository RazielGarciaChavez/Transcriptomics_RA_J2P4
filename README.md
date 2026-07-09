# Transcriptoomanalyse van synoviumweefsel onthult verhoogde immuunactivatie en ontstekingssignalering bij reumatoïde artritis
Een transcriptomics analyse gedaan mbv R om te kijken welke genen meer of minder tot expressie komen bij personen met RA in vergelijking met een gezonde controlegroep. Daarnaast werd het gekeken welke pathways betrokken zijn bij de ziekte mbv een Gene Ontology analyse (GO).

<p align="center">
  <img src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Assets/Rheumatoid-Arthritis-Diagram.webp" width="1000"/>
</p>
<p align="right">
(Regencare, 2025)
</p>

# 1. Inhoud/Structuur

- `Assets` - overige figuren
- `Bronnen` - extra links en hulpmiddelen
- `Data/Raw` – ruwe datasets voor de analyse 
- `Data/Verwerkt` - verwerkte dataset gegenereerd met script
- `data_stewardship` - Data beheren 'disclaimer' (competentie)
- `Resultaten` - grafieken en plots
- `Script` – gebruikte R script voor analyse uitvoering en visualisatie
- `README.md` - resultaten analyse

# 2. Introductie
Reumatoïde artritis (RA) is een chronische inflammatoire auto-immuunziekte die wordt gekenmerkt door aanhoudende ontsteking van het gewrichtsslijmvlies, erosie van botten en kraakbeen, wat leidt tot gewrichtsdestructie. Het is een multifactoriële ziekte waarbij genetische en omgevingsfactoren een belangrijke rol spelen in zowel de gevoeligheid als het ontstaan van deze aandoening. De verschillen in ziekteverloop bij RA-patiënten zijn ook te wijten aan genetische en moleculaire kenmerken, zoals de patronen van ontstekingsmoleculen die aanwezig zijn in het ontstoken weefsel van de aangetaste gewrichten (Jahid et al., 2023).

Een manier om de invloed van deze genetische en moleculaire kenmerken beter te begrijpen is transcriptomics. Deze analyse maakt het mogelijk om genexpressiepatronen in weefsels te bestuderen en zo inzicht te krijgen in de moleculaire processen die betrokken zijn bij ziekteontwikkeling. 
In deze studie werd RNA-sequencingdata van synoviumbiopten van patiënten met RA en gezonde controles geanalyseerd in R (Platzer Id et al., 2019). Het doel was om verschillen in genexpressie tussen beide groepen te identificeren en betrokken biologische pathways te onderzoeken.



# 3. Methoden
Voor deze analyse werd gebruikgemaakt van een RNA-seq-dataset uit een eerder onderzoek naar artritis door Platzer et al. (2019). Uit deze dataset werden vier monsters geselecteerd van patiënten met RA die langer dan 12 maanden aan de ziekte leden, evenals vier monsters van personen zonder RA. 
<br>
<table>
  <caption><b>Tabel 1. </b> Overzicht van synoviumbiopten samples afkomstig uit een eerder uitgevoerd onderzoek (Platzer et al., 2019). </caption>
 <thead>
    <tr>
      <th align="left">FASTQ</th>
      <th align="left">Leeftijd</th>
      <th align="left">Geslacht</th>
      <th align="left">Groep</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="left"><b>SRR4785819</b></td>
      <td align="left">31</td>
      <td align="left">female</td>
      <td align="left">Normal</td>
    </tr>
      <td align="left"><b>SRR4785820</b></td>
      <td align="left">15</td>
      <td align="left">female</td>
      <td align="left">Normal</td>
    </tr>
      <td align="left"><b>SRR4785828</b></td>
      <td align="left">31</td>
      <td align="left">female</td>
      <td align="left">Normal</td>
    </tr>
      <td align="left"><b>SRR4785831</b></td>
      <td align="left">42</td>
      <td align="left">female</td>
      <td align="left">Normal</td>
    </tr>
      <td align="left"><b>SRR4785979</b></td>
      <td align="left">54</td>
      <td align="left">female</td>
      <td align="left">Rheumatoid arthritis (established)</td>
    </tr>
      <td align="left"><b>SRR4785980</b></td>
      <td align="left">66</td>
      <td align="left">female</td>
      <td align="left">Rheumatoid arthritis (established)</td>
    </tr>
      <td align="left"><b>SRR4785986</b></td>
      <td align="left">60</td>
      <td align="left">female</td>
      <td align="left">Rheumatoid arthritis (established)</td>
    </tr>
      <td align="left"><b>SRR4785988</b></td>
      <td align="left">59</td>
      <td align="left">female</td>
      <td align="left">Rheumatoid arthritis (established)</td>
    </tr>
  </tbody>
</table>

<br>

## 3.1 RNA-seq verwerking en genkwantificatie
Sequencing libraries werden voorbereid met behulp van het TruSeq Stranded Total RNA RiboZero-protocol en gesequenced op een Illumina HiSeq 2000-platform met behulp van gepaarde 100 bp-reads (GSM2371053: Rheumatoid Arthritis Tissue 18; Homo Sapiens; RNA-Seq - SRA - NCBI, n.d.-b). De reads werden met behulp van Rsubread gemapt tegen het humane referentiegenoom GRCh38. Vervolgens werd met featureCounts een countmatrix op genniveau opgesteld op basis van een GTF-annotatiebestand. 

## 3.2 Analyses
De differentiële genexpressie tussen de RA- en controlegroep werd bepaald met het R-pakket DESeq2 (v1.50.2) (Love et al., 2014). Genen werden als differentieel geëxpresseerd beschouwd wanneer zij voldeden aan een gecorrigeerde p-waarde (padj) < 0,05 en een absolute log₂ fold change > 1.

De lijst met significant differentieel geëxpresseerde genen werd vervolgens gebruikt voor een Gene Ontology (GO)-verrijkingsanalyse met het R-pakket clusterProfiler (v4.18.4) (Yu et al., 2012). Vooraf werden de gensymbolen omgezet naar Entrez-ID's met org.Hs.eg.db (v3.22.0). Alleen de genen die voldeden aan de bovengenoemde selectiecriteria (padj < 0,05 en |log₂FC| > 1) werden meegenomen in de GO-analyse.

Daarnaast werd een KEGG pathway enrichment analyse uitgevoerd met clusterProfiler (v4.18.4) (Yu et al., 2012), eveneens op basis van de significante genen. De drie meest relevante pathways voor RA werden vervolgens gevisualiseerd met het R-pakket pathview (v1.50.0) (Luo & Brouwer, 2013). De volcano plot werd gemaakt met EnhancedVolcano (v1.28.2), terwijl de GO- en KEGG-dotplots werden gegenereerd met ggplot2 (v4.0.3) en enrichplot (v1.30.5).

<p align="center">
  <img width="400" height="500" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Assets/StroomschemaTranscriptomics.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 1. Data verwerking en analyse stroomschema. </b> Ruwe RNA-seq data werden gemapt op het referentiegenoom (GRCh38), waarna een countmatrix werd gegenereerd met featureCounts. Differentiële genexpressieanalyse werd uitgevoerd met DESeq2 en gevisualiseerd met een volcanoplot met EnhancedVolcano. De geïdentificeerde differentieel geëxpresseerde genen werden vervolgens gebruikt voor Gene Ontology (GO)- en KEGG-verrijkingsanalyses, gevolgd door pathway-visualisatie en biologische interpretatie van de resultaten. </em>
</p>

<br>

# 4. Resultaten

## 4.1 Alignment- en differentiële genexpressieanalyse
Alignment met het menselijke referentiegenome (GRCh38) leverde 9.914 gemapte fragmenten op van de in totaal 10.000 fragmenten (99,1%). De meeste aligned reads waren correct gepaard (93,7%), wat wijst op een goede alignment-kwaliteit. In totaal werden 29.407 genen geanalyseerd. Differentiële expressieanalyse met DESeq2 identificeerde 5.119 significant verschillend geëxpresseerde genen tussen patiënten met reumatoïde artritis en gezonde controles (p < 0,05). Wanneer daarnaast een drempel van Log2 fold change > 1 werd toegepast, bleven 4.572 genen significant. 
De vulkaanplot visualiseert de geanalyseerde genen en scheidt de statistisch significante genen door middel van kleur, waarbij een iets grotere groep omlaag gereguleerde genen te zien is dan omhoog gereguleerde genen. De meest significant omlaag gereguleerde genen omvatten onder andere ANKRD30BL, MT-ND6, RAB3IL1, SLC9A3R2 en ZNF598. Daarentegen was het meest omhoog gereguleerde gen in RA-monsters SRGN; deze resultaten komen overeen met het artikel van La Rosa et al. (2025).
<p align="center">
  <img width="400" height="500" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Resultaten/Volcanoplot.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 2. Differentiële expressie vulkaanplot tussen synoviumweefsel van RA patiënten en gezonde controles. </b> Op de x-as staat de log₂ fold change van de genexpressie en op de y-as de −log₁₀(p-waarde). Rode punten representeren genen die zowel een significante verandering in expressie als een relevante fold change vertonen. Groene punten voldoen uitsluitend aan de fold-change drempel en grijze punten zijn niet significant. Zowel op- als neergereguleerde genen werden waargenomen, waarbij meerdere genen een sterke verandering in expressie vertoonden. Figuur gevisualiseerd met het R-pakket EnhancedVolcano. </em>
</p>

<br>

## 4.2 Gene Ontology-verrijkingsanalyse
Bij de GO-analyse waren verschillende verrijkte GO-termen geassocieerd met B-cel- en T-celfunctie, waaronder B-celgemedieerde immuniteit, antigeenreceptor-gemedieerde signaalroute en adaptieve immuunrespons gebaseerd op somatische recombinatie van immuunreceptoren. Op basis van de observaties van de GO-analyse werden pathways gevisualiseerd, plus een pathway die zich uitsluitend richtte op de ziekte zelf (zie Figuren 4, 5 en 6).

<p align="center">
  <img width="500" height="500" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Resultaten/GOanalysis.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 3. Gene Ontology (GO) verrijkingsanalyse van differentieel geëxpresseerde genen tussen RA patiënten en gezonde controles. </b> De y-as toont de verrijkte biologische processen, terwijl de x-as het percentage differentieel geëxpresseerde genen binnen elk GO-term weergeeft (Hits %). De grootte van de punten correspondeert met het aantal genen dat aan een GO-term is gekoppeld en de kleur geeft de significantie van de verrijking weer als −log10(FDR). De meest verrijkte processen waren gerelateerd aan immuunfunctie, waaronder lymfocytdifferentiatie, leukocyt-gemedieerde immuniteit, T-celdifferentiatie en B-cel-gemedieerde immuniteit. De analyse werd uitgevoerd met behulp van het R-pakket clusterProfiler in combinatie met de database voor menselijke genannotatie org.Hs.eg.db. GO-termen werden gevisualiseerd met behulp van dotplots die gegenereerd werden met clusterProfiler, dat gebaseerd is op ggplot2. </em>
</p>

<br>

## 4.3 Pathways

<p align="center">
  <img width="700" height="700" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Resultaten/hsa04660.pathview.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 4. Visualisatie van de T-cell receptor signaling pathway  op basis van differentiële genexpressie tussen RA patiënten en gezonde controles. </b> De pathway (hsa04660) werd gevisualiseerd met het R-pakket Pathview op basis van GO-analyse resultaten. Rood gekleurde genen zijn opgereguleerd in RA, terwijl groen gekleurde genen neerwaarts gereguleerd zijn. Binnen deze pathway werden meerdere genen betrokken bij T-celactivatie en immuunsignalering differentieel geëxpresseerd, waaronder CD3D, CD3E, CD45, ZAP70, GADS, ITK en PI3K. Daarnaast werden veranderingen waargenomen in componenten van de MAPK- en NF-κB-signaalroutes. Deze resultaten wijzen op een veranderde T-celgemedieerde immuunrespons, wat overeenkomt met eerdere onderzoeken (Cope, 2008). </em>
</p>

<br>

<p align="center">
  <img width="700" height="700" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Resultaten/hsa04662.pathview.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 5. Visualisatie van de B-cell receptor signaling pathway op basis van differentiële genexpressie tussen RA patiënten en gezonde controles. </b> De pathway (hsa04662) werd gevisualiseerd met het R-pakket Pathview op basis van KEGG-annotaties. Rode genen vertegenwoordigen verhoogde expressie in RA en groene genen verlaagde expressie. Verschillende genen betrokken bij B-celactivatie en antigeenherkenning waren differentieel geëxpresseerd, waaronder CD72, CD22, BANK1, BLNK, PLCγ2 en CD19. Tevens werden veranderingen waargenomen in de PI3K-AKT-, MAPK- en NF-κB-signaalroutes. De verrijking van deze pathway ondersteunt de rol van B-cellen en humorale immuniteit in de pathogenese van reumatoïde artritis. </em>
</p>

<br>

<p align="center">
  <img width="700" height="700" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Resultaten/hsa05323.pathview.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 6. Visualisatie van de bij Rheumatoid Arthritis betrokken pathways. </b> De pathway (hsa05323) werd gevisualiseerd met het R-pakket Pathview op basis van KEGG-annotaties. Rode gekleurde genen vertegenwoordigen verhoogde expressie in RA terwijl groen gekleurde genen verlaagde expressie aantonen. Verschillende ontstekingsgerelateerde genen, waaronder IL6, IL1β, CXCL1, CXCL5, CCL2 en MMP13, vertoonden verhoogde expressie. Daarnaast waren ook immuunregulerende moleculen zoals CD28, CTLA4, TLR2/4 en IFNγ opgereguleerd. Daarentegen lieten enkele genen, waaronder VEGF, APRIL, MCSF, IL17 en TGFβ, een verlaagde expressie zien. De resultaten wijzen op een verhoogde activatie van ontstekings-, immuunrespons- en weefselafbraakprocessen die kenmerkend zijn voor reumatoïde artritis (McInnes & Schett, 2011). </em>
</p>

<br>

## 4.4 KEGG-pathwayanalyse
De KEGG-pathway toonde meer pathways aan, waaronder MAPK-signaleringsroute vertoonde de hoogste verrijking, gevolgd door NOD-achtige receptorsignalering, TNF-signalering, NF-κB-signalering, IL-17-signalering en Th17-celdifferentiatie. 
 <p align="center">
  <img width="600" height="700" alt="Image" src="https://github.com/RazielGarciaChavez/Transcriptomics_RA_J2P4/blob/main/Resultaten/KEGGresultaten.png" />
  <br>
</p>
<p align="left">
  <em><b>Figuur 7. KEGG pathway enrichment analysis van differentieel geëxpresseerde genen tussen RA patiënten en gezonde controles. </b> De y-as toont de verrijkte KEGG-signaalroutes, terwijl de x-as het aandeel differentieel geëxpresseerde genen binnen elke pathway, oftewel GeneRatio. De puntengrootte komt overeen met het aantal betrokken genen en de kleur geeft de gecorrigeerde p-waarde weer. De analyse liet een significante verrijking zien van immuun- en ontstekingsgerelateerde pathways, waaronder de MAPK-, TNF-, NF-κB-, IL-17- en NOD-like receptor-signaalroutes. De analyse werd uitgevoerd met behulp van het R-pakket clusterProfiler in combinatie met de KEGG-database. Verrijkte pathways werden gevisualiseerd als dotplots gegenereerd met clusterProfiler, dat gebaseerd is op ggplot2. </em>
</p>

<br>

# 5. Conclusie
In deze studie werd RNA-sequencingdata van synoviumbiopten van RA-patiënten en gezonde controles transcriptomisch geanalyseerd in R. De resultaten tonen significante verschillen in genexpressie tussen beide groepen.

DESeq2 differentiële expressieanalyse resultaten wijzen op uitgebreide veranderingen in genexpressie tussen RA patiënten en gezonde controles. De genen die betrokken zijn bij zowel de verhoogde als de verlaagde expressie suggereren dat immuunactivering, ontstekingsprocessen, veranderingen in cellulaire signalering en energiemetabolisme een rol spelen bij reumatoïde artritis.

Terwijl de GO-analyse veel immuungerelateerde biologische processen identificeerde onder de differentieel tot expressie gebrachte genen, toonde de KEGG-analyse ook pathways aan die betrokken zijn bij immuunregulatie, ontsteking, cytokineproductie, activatie van immuuncellen en chronische ontstekingsreacties.

Een beperking van deze studie is dat alle monsters afkomstig waren van vrouwelijke patiënten, wat kan hebben geleid tot seksegerelateerde vertekening. Toekomstig onderzoek kan daarom monsters van beide geslachten gebruiken of zich richten op enkele genen en signaalroutes die verschillen tussen RA-patiënten en gezonde controles.

# 6. Literatuurlijst

Cope, A. P. (2008). T cells in rheumatoid arthritis. Arthritis Research & Therapy, 10(Suppl 1), S1. https://doi.org/10.1186/ar2412

GSM2371053: rheumatoid arthritis tissue 18; Homo sapiens; RNA-Seq - SRA - NCBI. (n.d.-b). https://www.ncbi.nlm.nih.gov/sra?term=SRX2316126&utm

Jahid, M., Khan, K. U., Rehan-Ul-Haq, & Ahmed, R. S. (2023). Overview of Rheumatoid Arthritis and Scientific Understanding of the Disease. Mediterranean Journal of Rheumatology, 34(3), 284. https://doi.org/10.31138/MJR.20230801.OO

La Rosa, F. G., Moreland, L. W., Nibali, L., Curtis, M., Deane, K. D., Strickland, C., Seifert, J., Keeter, C., Simberg, D., Scheinman, R. I., Lau, R., Pitzalis, C., Lewis, M. J., Holers, V. M., Banda, N. K., & Network, O. B. O. T. a. M. P. R. (2025). Pathotype-Specific expression of Granzyme-Perforin pathway genes and their association with clinical disease activity in early rheumatoid arthritis and in a randomized clinical trial. Immune Network, 25(4), e25. https://doi.org/10.4110/in.2025.25.e25

Love, M. I., Huber, W., & Anders, S. (2014). Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2. Genome Biology, 15(12), 550. https://doi.org/10.1186/s13059-014-0550-8

Luo, W., & Brouwer, C. (2013). Pathview: An R/Bioconductor package for pathway-based data integration and visualization. Bioinformatics, 29(14), 1830–1831. https://doi.org/10.1093/bioinformatics/btt285

McInnes, I. B., & Schett, G. (2011). The pathogenesis of rheumatoid arthritis. New England Journal of Medicine, 365(23), 2205–2219. https://doi.org/10.1056/NEJMra1004965

Platzer Id, A., Nussbaumer Id, T., Karonitsch, T., Smolen, J. S., & Aletaha, D. (2019). Analysis of gene expression in rheumatoid arthritis and related conditions offers insights into sex-bias, gene biotypes and co-expression patterns. https://doi.org/10.1371/journal.pone.0219698

Regencare. (2025, May 19). Living Beyond RA: Understanding rheumatoid arthritis and Regencare’s commitment to your care - Regencare. https://regencare.in/ortho/rheumatoid-arthritis-treatment/

Yu, G., Wang, L. G., Han, Y., & He, Q. Y. (2012). clusterProfiler: An R package for comparing biological themes among gene clusters. OMICS: A Journal of Integrative Biology, 16(5), 284–287. https://doi.org/10.1089/omi.2011.0118

# AI- Disclaimer
Bij de uitvoering van dit project is gebruikgemaakt van een AI-assistent voor ondersteuning bij programmeervragen, data-analyse en taalcorrectie. Alle resultaten, interpretaties en conclusies zijn door de student zelfstandig gecontroleerd en vastgesteld.
