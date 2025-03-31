<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.37 (Build 264) (http://www.copasi.org) at 2022-11-28T14:22:48Z -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="37" versionDevel="264" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_39" name="Function for v23b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_39" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k23b*pC3G/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_264" name="default" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_263" name="k23b" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_262" name="pC3G" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_40" name="Function for v24" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_40" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat24*pC3G*Rap1/(Rap1+Km24)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_265" name="Kcat24" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_250" name="Km24" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_261" name="Rap1" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_266" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_267" name="pC3G" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_41" name="Function for v25" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_41" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat25*Rap1Gap*pRap1/(pRap1+Km25)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_272" name="Kcat25" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_271" name="Km25" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_270" name="Rap1Gap" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_269" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_268" name="pRap1" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_42" name="Function for v26a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_42" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        V26a/(1+(GSK3B/k26a)^2.5)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_277" name="GSK3B" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_276" name="V26a" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_275" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_274" name="k26a" order="3" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_43" name="Function for v26b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_43" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k26b*PKCD/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_280" name="PKCD" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_279" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_278" name="k26b" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_44" name="Function for v27a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_44" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat27a*GSK3B*pERK/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_282" name="GSK3B" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_281" name="Kcat27a" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_273" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_283" name="pERK" order="3" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_45" name="Function for v27b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_45" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat27b*GSK3B*pAkt/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_287" name="GSK3B" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_286" name="Kcat27b" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_285" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_284" name="pAkt" order="3" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_46" name="Function for v2" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_46" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (k21*EGF*fEGFR-k22*bEGFR)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_291" name="EGF" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_290" name="bEGFR" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_289" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_288" name="fEGFR" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_292" name="k21" order="4" role="variable"/>
        <ParameterDescription key="FunctionParameter_293" name="k22" order="5" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_47" name="Function for v20" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_47" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat20*pPI3K*PIP2/(PIP2+Km20)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_299" name="Kcat20" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_298" name="Km20" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_297" name="PIP2" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_296" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_295" name="pPI3K" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_48" name="Function for v21" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_48" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat21*PTEN*PIP3/(PIP3+Km21)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_303" name="Kcat21" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_302" name="Km21" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_301" name="PIP3" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_300" name="PTEN" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_294" name="default" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_49" name="Function for v22a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_49" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat22a*PIP3*Akt/(Akt+Km22a)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_308" name="Akt" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_307" name="Kcat22a" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_306" name="Km22a" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_305" name="PIP3" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_304" name="default" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_50" name="Function for v22b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_50" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat22b*pAkt/(Km22b+pAkt)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_313" name="Kcat22b" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_312" name="Km22b" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_311" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_310" name="pAkt" order="3" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_51" name="Function for v23a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_51" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat23a*bEGFR*C3G/(C3G+Km23a)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_316" name="C3G" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_315" name="Kcat23a" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_314" name="Km23a" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_309" name="bEGFR" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_317" name="default" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_52" name="Function for v16b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_52" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat16b*pRap1*BRaf/(BRaf+Km16b)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_322" name="BRaf" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_321" name="Kcat16b" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_320" name="Km16b" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_319" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_318" name="pRap1" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_53" name="Function for v18a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_53" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k18a*pP90Rsk/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_327" name="default" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_326" name="k18a" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_325" name="pP90Rsk" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_54" name="Function for v18b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_54" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat18b*pERK*P90Rsk/(P90Rsk+Km18b)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_328" name="Kcat18b" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_323" name="Km18b" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_324" name="P90Rsk" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_329" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_330" name="pERK" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_55" name="Function for v19a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_55" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat19a*bEGFR*PI3K/(PI3K+Km19a)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_335" name="Kcat19a" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_334" name="Km19a" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_333" name="PI3K" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_332" name="bEGFR" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_331" name="default" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_56" name="Function for v19b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_56" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat19b*pRas*PI3K/(PI3K+Km19b)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_340" name="Kcat19b" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_339" name="Km19b" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_338" name="PI3K" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_337" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_336" name="pRas" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_57" name="Function for v19c" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_57" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k19c*pPI3K/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_345" name="default" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_344" name="k19c" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_343" name="pPI3K" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_58" name="Function for v32a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_58" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k32a*APCAxinGSK3B/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_346" name="APCAxinGSK3B" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_341" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_342" name="k32a" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_59" name="Function for v32b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_59" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k32b*pAPCpAxinGSK3B/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_349" name="default" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_348" name="k32b" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_347" name="pAPCpAxinGSK3B" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_60" name="Function for v33a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_60" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (k33a1*Axin*APC-k33a2*APCAxin)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_352" name="APC" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_351" name="APCAxin" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_350" name="Axin" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_353" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_354" name="k33a1" order="4" role="variable"/>
        <ParameterDescription key="FunctionParameter_355" name="k33a2" order="5" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_61" name="Function for v33b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_61" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k33b*Axin/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_361" name="Axin" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_360" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_359" name="k33b" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_62" name="Function for v33c" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_62" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (k33c1+k33c2*(TCFBCatenin+BCatenin))/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_356" name="BCatenin" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_357" name="TCFBCatenin" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_358" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_362" name="k33c1" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_363" name="k33c2" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_63" name="Function for v34" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_63" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (k341*pAPCpAxinGSK3B*BCatenin-k342*pAPCpAxinGSK3BBCatenin)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_368" name="BCatenin" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_367" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_366" name="k341" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_365" name="k342" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_364" name="pAPCpAxinGSK3B" order="4" role="variable"/>
        <ParameterDescription key="FunctionParameter_369" name="pAPCpAxinGSK3BBCatenin" order="5" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_64" name="Function for v35" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_64" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k35*pAPCpAxinGSK3BBCatenin/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_375" name="default" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_374" name="k35" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_373" name="pAPCpAxinGSK3BBCatenin" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_65" name="Function for v27c" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_65" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k27c*RKIP/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_370" name="RKIP" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_371" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_372" name="k27c" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_66" name="Function for v27d" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_66" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat27d*pGSK3B/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_378" name="Kcat27d" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_377" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_376" name="pGSK3B" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_67" name="Function for v28" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_67" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k28*Dshi*W/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_381" name="Dshi" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_380" name="W" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_379" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_382" name="k28" order="3" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_68" name="Function for v29" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_68" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k29*Dsha/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_386" name="Dsha" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_385" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_384" name="k29" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_69" name="Function for v3" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_69" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k3*fEGFR/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_388" name="default" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_387" name="fEGFR" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_383" name="k3" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_70" name="Function for v30" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_70" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k30*Dsha*APCAxinGSK3B/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_391" name="APCAxinGSK3B" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_390" name="Dsha" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_389" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_392" name="k30" order="3" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_71" name="Function for v36" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_71" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k36*pAPCpAxinGSK3BpBCatenin/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_396" name="default" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_395" name="k36" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_394" name="pAPCpAxinGSK3BpBCatenin" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_72" name="Function for v37a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_72" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (k37a1*APC*BCatenin-k37a2*APCBCatenin)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_398" name="APC" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_397" name="APCBCatenin" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_393" name="BCatenin" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_399" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_400" name="k37a1" order="4" role="variable"/>
        <ParameterDescription key="FunctionParameter_401" name="k37a2" order="5" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_73" name="Function for v37b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_73" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        V37b/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_407" name="V37b" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_406" name="default" order="1" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_74" name="Function for v37c" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_74" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k37c*BCatenin/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_404" name="BCatenin" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_405" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_403" name="k37c" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_75" name="Function for v38" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_75" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (k381*BCatenin*TCF-k382*TCFBCatenin)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_409" name="BCatenin" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_408" name="TCF" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_402" name="TCFBCatenin" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_410" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_411" name="k381" order="4" role="variable"/>
        <ParameterDescription key="FunctionParameter_412" name="k382" order="5" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_76" name="Function for v39" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_76" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k39*TCFBCatenin^2/(Km39^2+TCFBCatenin^2)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_418" name="Km39" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_417" name="TCFBCatenin" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_416" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_415" name="k39" order="3" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_77" name="Function for v4" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_77" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k4*bEGFR/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_420" name="bEGFR" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_419" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_413" name="k4" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_78" name="Function for v40" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_78" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k40*X/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_422" name="X" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_421" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_414" name="k40" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_79" name="Function for v41" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_79" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k41*pBCatenin/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_425" name="default" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_424" name="k41" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_423" name="pBCatenin" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_80" name="Function for v5" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_80" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (k51*bEGFR+k52+k53*PKCD)/(1+pERK/k54)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_428" name="PKCD" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_427" name="bEGFR" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_426" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_429" name="k51" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_430" name="k52" order="4" role="variable"/>
        <ParameterDescription key="FunctionParameter_431" name="k53" order="5" role="variable"/>
        <ParameterDescription key="FunctionParameter_432" name="k54" order="6" role="variable"/>
        <ParameterDescription key="FunctionParameter_433" name="pERK" order="7" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_81" name="Function for v6a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_81" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k6a*pSOS/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_441" name="default" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_440" name="k6a" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_439" name="pSOS" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_82" name="Function for v6b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_82" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat6b*pP90Rsk*pSOS/(pSOS+Km6b)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_436" name="Kcat6b" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_437" name="Km6b" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_438" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_435" name="pP90Rsk" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_434" name="pSOS" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_83" name="Function for v7" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_83" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat7*pSOS*Ras/(Ras+Km7)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_446" name="Kcat7" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_445" name="Km7" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_444" name="Ras" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_443" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_442" name="pSOS" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_84" name="Function for v12" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_84" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat12*PP2A*pMEK/(pMEK+Km12)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_451" name="Kcat12" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_450" name="Km12" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_449" name="PP2A" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_448" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_447" name="pMEK" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_85" name="Function for v13" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_85" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat13*pMEK*ERK/(ERK+Km13)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_456" name="ERK" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_455" name="Kcat13" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_454" name="Km13" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_453" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_452" name="pMEK" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_86" name="Function for v14" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_86" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat14*PP2A*pERK/(pERK+Km14)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_461" name="Kcat14" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_460" name="Km14" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_459" name="PP2A" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_458" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_457" name="pERK" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_87" name="Function for v15a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_87" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k15a*pERK*(RKIP-pRKIP)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_466" name="RKIP" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_465" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_464" name="k15a" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_463" name="pERK" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_462" name="pRKIP" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_88" name="Function for v15b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_88" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        V15b*pRKIP/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_471" name="V15b" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_470" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_469" name="pRKIP" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_89" name="Function for v15c" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_89" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k15c*RKIP/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_472" name="RKIP" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_467" name="default" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_468" name="k15c" order="2" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_90" name="Function for v16a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_90" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat16a*pRas*BRaf/(BRaf+Km16a)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_475" name="BRaf" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_474" name="Kcat16a" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_473" name="Km16a" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_476" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_477" name="pRas" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_91" name="Function for v31" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_91" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        (k311*GSK3B*APCAxin-k312*APCAxinGSK3B)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_482" name="APCAxin" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_481" name="APCAxinGSK3B" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_480" name="GSK3B" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_479" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_478" name="k311" order="4" role="variable"/>
        <ParameterDescription key="FunctionParameter_483" name="k312" order="5" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_92" name="Function for v11b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_92" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k11b1*pRaf1*MEK/(1+((RKIP-pRKIP)/k11b2)^2)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_489" name="MEK" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_488" name="RKIP" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_487" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_486" name="k11b1" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_485" name="k11b2" order="4" role="variable"/>
        <ParameterDescription key="FunctionParameter_484" name="pRKIP" order="5" role="variable"/>
        <ParameterDescription key="FunctionParameter_490" name="pRaf1" order="6" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_93" name="Function for v1" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_93" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        V1/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_497" name="V1" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_496" name="default" order="1" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_94" name="Function for v10a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_94" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat10a*RafPPtase*pRaf1/(pRaf1+Km10a)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_494" name="Kcat10a" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_495" name="Km10a" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_493" name="RafPPtase" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_492" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_491" name="pRaf1" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_95" name="Function for v10b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_95" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat10b*pAkt*pRaf1/(pRaf1+Km10b)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_502" name="Kcat10b" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_501" name="Km10b" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_500" name="default" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_499" name="pAkt" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_498" name="pRaf1" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_96" name="Function for v11a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_96" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat11a*pBRaf*MEK/(MEK+Km11a)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_507" name="Kcat11a" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_506" name="Km11a" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_505" name="MEK" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_504" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_503" name="pBRaf" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_97" name="Function for v8a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_97" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        V8a/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_512" name="V8a" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_511" name="default" order="1" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_98" name="Function for v8b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_98" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat8b*RasGap*pRas/(pRas+Km8b)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_509" name="Kcat8b" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_510" name="Km8b" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_508" name="RasGap" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_513" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_514" name="pRas" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_99" name="Function for v9a" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_99" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Kcat9a*pRas*Raf1/(Raf1+Km9a)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_519" name="Kcat9a" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_518" name="Km9a" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_517" name="Raf1" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_516" name="default" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_515" name="pRas" order="4" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_100" name="Function for v9b" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_100" />
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        k9b*W*X*Raf1/(Km9b+Raf1)/default
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_524" name="Km9b" order="0" role="variable"/>
        <ParameterDescription key="FunctionParameter_523" name="Raf1" order="1" role="variable"/>
        <ParameterDescription key="FunctionParameter_522" name="W" order="2" role="variable"/>
        <ParameterDescription key="FunctionParameter_521" name="X" order="3" role="variable"/>
        <ParameterDescription key="FunctionParameter_520" name="default" order="4" role="variable"/>
        <ParameterDescription key="FunctionParameter_525" name="k9b" order="5" role="variable"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_101" name="MM Mod" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
      </MiriamAnnotation>
      <Expression>
        Kcat*modifier*substrate/(km+substrate)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_531" name="Kcat" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_530" name="modifier" order="1" role="modifier"/>
        <ParameterDescription key="FunctionParameter_529" name="substrate" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_528" name="km" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_5" name="_1" simulationType="time" timeUnit="s" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="nmol" type="deterministic" avogadroConstant="6.0221417899999999e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Model_5">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2022-11-21T07:48:59Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <ListOfCompartments>
      <Compartment key="Compartment_4" name="default" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_4">
    <CopasiMT:is>
      <rdf:Bag>
        <rdf:li rdf:resource="http://identifiers.org/sbo/SBO:0000410" />
      </rdf:Bag>
    </CopasiMT:is>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_224" name="APC" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_224" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_225" name="APCAxin" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_225" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_226" name="APCAxinGSK3B" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_226" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_227" name="APCBCatenin" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_227" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_228" name="Akt" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_228" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_229" name="Axin" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_229" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_230" name="BCatenin" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_230" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_231" name="BRaf" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_231" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_232" name="C3G" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_232" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_233" name="Dsha" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_233" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_234" name="Dshi" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_234" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_235" name="EGF" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_235" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_236" name="ERK" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_236" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_237" name="GSK3B" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_237" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_238" name="MEK" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_238" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_239" name="P90Rsk" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_239" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_240" name="PI3K" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_240" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_241" name="PIP2" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_241" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_242" name="PIP3" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_242" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_243" name="PKCD" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_243" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_244" name="PP2A" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_244" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_245" name="PTEN" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_245" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_246" name="RKIP" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_246" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_247" name="Raf1" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_247" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_248" name="RafPPtase" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_248" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_249" name="Rap1" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_249" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_250" name="Rap1Gap" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_250" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_251" name="Ras" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_251" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_252" name="RasGap" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_252" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_253" name="SOS" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_253" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_254" name="TCF" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_254" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_255" name="TCFBCatenin" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_255" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_256" name="X" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_256" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_257" name="bEGFR" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_257" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_258" name="dEGFR" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_258" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_259" name="fEGFR" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_259" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_260" name="null" simulationType="fixed" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_260" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_261" name="pAPCpAxinGSK3B" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_261" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_262" name="pAPCpAxinGSK3BBCatenin" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_262" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_263" name="pAPCpAxinGSK3BpBCatenin" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_263" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_264" name="pAkt" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_264" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_265" name="pBCatenin" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_265" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_266" name="pBRaf" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_266" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_267" name="pC3G" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_267" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_268" name="pEGFR" simulationType="fixed" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_268" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_269" name="pERK" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_269" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_270" name="pGSK3B" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_270" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_271" name="pMEK" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_271" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_272" name="pP90Rsk" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_272" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_273" name="pPI3K" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_273" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_274" name="pRKIP" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_274" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_275" name="pRaf1" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_275" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_276" name="pRap1" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_276" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_277" name="pRas" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_277" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_278" name="pSOS" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_278" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_279" name="Vem" simulationType="reactions" compartment="Compartment_4" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_279">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_416" name="Kcat10a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_416" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_417" name="Kcat10b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_417" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_418" name="Kcat11a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_418" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_419" name="Kcat12" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_419" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_420" name="Kcat13" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_420" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_421" name="Kcat14" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_421" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_422" name="Kcat16a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_422" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_423" name="Kcat16b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_423" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_424" name="Kcat17a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_424" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_425" name="Kcat17b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_425" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_426" name="Kcat18b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_426" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_427" name="Kcat19a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_427" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_428" name="Kcat19b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_428" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_429" name="Kcat20" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_429" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_430" name="Kcat21" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_430" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_431" name="Kcat22a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_431" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_432" name="Kcat22b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_432" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_433" name="Kcat23a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_433" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_434" name="Kcat24" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_434" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_435" name="Kcat25" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_435" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_436" name="Kcat27a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_436" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_437" name="Kcat27b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_437" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_438" name="Kcat27d" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_438" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_439" name="Kcat6b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_439" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_440" name="Kcat7" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_440" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_441" name="Kcat8b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_441" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_442" name="Kcat9a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_442" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_443" name="Km10a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_443" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_444" name="Km10b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_444" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_445" name="Km11a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_445" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_446" name="Km12" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_446" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_447" name="Km13" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_447" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_448" name="Km14" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_448" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_449" name="Km16a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_449" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_450" name="Km16b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_450" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_451" name="Km17a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_451" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_452" name="Km17b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_452" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_453" name="Km18b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_453" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_454" name="Km19a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_454" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_455" name="Km19b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_455" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_456" name="Km20" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_456" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_457" name="Km21" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_457" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_458" name="Km22a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_458" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_459" name="Km22b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_459" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_460" name="Km23a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_460" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_461" name="Km24" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_461" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_462" name="Km25" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_462" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_463" name="Km39" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_463" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_464" name="Km6b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_464" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_465" name="Km7" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_465" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_466" name="Km8b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_466" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_467" name="Km9a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_467" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_468" name="Km9b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_468" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_469" name="V1" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_469" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_470" name="V15b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_470" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_471" name="V26a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_471" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_472" name="V37b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_472" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_473" name="V8a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_473" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_474" name="W" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_474" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_475" name="defaultcompartment" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_475" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_476" name="k11b1" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_476" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_477" name="k11b2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_477" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_478" name="k15a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_478" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_479" name="k15c" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_479" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_480" name="k18a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_480" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_481" name="k19c" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_481" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_482" name="k21" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_482" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_483" name="k22" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_483" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_484" name="k23b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_484" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_485" name="k26a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_485" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_486" name="k26b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_486" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_487" name="k27c" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_487" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_488" name="k28" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_488" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_489" name="k29" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_489" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_490" name="k3" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_490" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_491" name="k30" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_491" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_492" name="k311" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_492" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_493" name="k312" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_493" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_494" name="k32a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_494" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_495" name="k32b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_495" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_496" name="k33a1" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_496" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_497" name="k33a2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_497" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_498" name="k33b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_498" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_499" name="k33c1" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_499" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_500" name="k33c2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_500" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_501" name="k341" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_501" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_502" name="k342" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_502" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_503" name="k35" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_503" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_504" name="k36" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_504" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_505" name="k37a1" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_505" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_506" name="k37a2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_506" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_507" name="k37c" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_507" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_508" name="k381" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_508" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_509" name="k382" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_509" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_510" name="k39" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_510" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_511" name="k4" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_511" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_512" name="k40" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_512" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_513" name="k41" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_513" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_514" name="k51" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_514" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_515" name="k52" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_515" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_516" name="k53" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_516" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_517" name="k54" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_517" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_518" name="k6a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_518" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_519" name="k9b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_519" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_252" name="v1" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_252" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_268" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_259" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6015" name="V1" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_93" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_497">
              <SourceParameter reference="ModelValue_469"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_496">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_253" name="v10a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_253" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_248" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_275" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_248" stoichiometry="1"/>
          <Product metabolite="Metabolite_247" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6016" name="Kcat10a" value="1"/>
          <Constant key="Parameter_6018" name="Km10a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_94" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_494">
              <SourceParameter reference="ModelValue_416"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_495">
              <SourceParameter reference="ModelValue_443"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_493">
              <SourceParameter reference="Metabolite_248"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_492">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_491">
              <SourceParameter reference="Metabolite_275"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_254" name="v10b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_254" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_264" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_275" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_264" stoichiometry="1"/>
          <Product metabolite="Metabolite_247" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6014" name="Kcat10b" value="1"/>
          <Constant key="Parameter_6017" name="Km10b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_95" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_502">
              <SourceParameter reference="ModelValue_417"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_501">
              <SourceParameter reference="ModelValue_444"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_500">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_499">
              <SourceParameter reference="Metabolite_264"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_498">
              <SourceParameter reference="Metabolite_275"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_255" name="v11a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_255" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_266" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_238" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_266" stoichiometry="1"/>
          <Product metabolite="Metabolite_271" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5425" name="Kcat11a" value="1"/>
          <Constant key="Parameter_5426" name="Km11a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_96" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_507">
              <SourceParameter reference="ModelValue_418"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_506">
              <SourceParameter reference="ModelValue_445"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_505">
              <SourceParameter reference="Metabolite_238"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_504">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_503">
              <SourceParameter reference="Metabolite_266"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_256" name="v11b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_256" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_274" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_275" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_238" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_274" stoichiometry="1"/>
          <Product metabolite="Metabolite_275" stoichiometry="1"/>
          <Product metabolite="Metabolite_271" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_246" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_5428" name="k11b1" value="1"/>
          <Constant key="Parameter_5424" name="k11b2" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_92" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_489">
              <SourceParameter reference="Metabolite_238"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_488">
              <SourceParameter reference="Metabolite_246"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_487">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_486">
              <SourceParameter reference="ModelValue_476"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_485">
              <SourceParameter reference="ModelValue_477"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_484">
              <SourceParameter reference="Metabolite_274"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_490">
              <SourceParameter reference="Metabolite_275"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_257" name="v12" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_257" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_271" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_244" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_238" stoichiometry="1"/>
          <Product metabolite="Metabolite_244" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5427" name="Kcat12" value="1"/>
          <Constant key="Parameter_4495" name="Km12" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_84" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_451">
              <SourceParameter reference="ModelValue_419"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_450">
              <SourceParameter reference="ModelValue_446"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_244"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_448">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_447">
              <SourceParameter reference="Metabolite_271"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_258" name="v13" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_258" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_271" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_236" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_271" stoichiometry="1"/>
          <Product metabolite="Metabolite_269" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4496" name="Kcat13" value="1"/>
          <Constant key="Parameter_4498" name="Km13" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_85" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_456">
              <SourceParameter reference="Metabolite_236"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_455">
              <SourceParameter reference="ModelValue_420"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_454">
              <SourceParameter reference="ModelValue_447"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_453">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_452">
              <SourceParameter reference="Metabolite_271"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_259" name="v14" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_259" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_269" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_244" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_236" stoichiometry="1"/>
          <Product metabolite="Metabolite_244" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4494" name="Kcat14" value="1"/>
          <Constant key="Parameter_4497" name="Km14" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_86" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_461">
              <SourceParameter reference="ModelValue_421"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_460">
              <SourceParameter reference="ModelValue_448"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_459">
              <SourceParameter reference="Metabolite_244"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_458">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Metabolite_269"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_260" name="v15a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_260" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_269" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_246" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_269" stoichiometry="1"/>
          <Product metabolite="Metabolite_274" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5308" name="k15a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_87" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_466">
              <SourceParameter reference="Metabolite_246"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_465">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="ModelValue_478"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_463">
              <SourceParameter reference="Metabolite_269"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_462">
              <SourceParameter reference="Metabolite_274"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_261" name="v15b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_261" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_274" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_246" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5309" name="V15b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_88" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_471">
              <SourceParameter reference="ModelValue_470"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_470">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_469">
              <SourceParameter reference="Metabolite_274"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_262" name="v15c" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_262" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_246" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_260" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5311" name="k15c" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_89" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_472">
              <SourceParameter reference="Metabolite_246"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_467">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_468">
              <SourceParameter reference="ModelValue_479"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_263" name="v16a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_263" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_277" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_231" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_277" stoichiometry="1"/>
          <Product metabolite="Metabolite_266" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5307" name="Kcat16a" value="1"/>
          <Constant key="Parameter_5310" name="Km16a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_90" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_475">
              <SourceParameter reference="Metabolite_231"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_474">
              <SourceParameter reference="ModelValue_422"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_473">
              <SourceParameter reference="ModelValue_449"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_476">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_477">
              <SourceParameter reference="Metabolite_277"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_264" name="v16b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_264" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_276" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_231" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_276" stoichiometry="1"/>
          <Product metabolite="Metabolite_266" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4505" name="Kcat16b" value="1"/>
          <Constant key="Parameter_4506" name="Km16b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_52" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_322">
              <SourceParameter reference="Metabolite_231"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_321">
              <SourceParameter reference="ModelValue_423"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_320">
              <SourceParameter reference="ModelValue_450"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_319">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_318">
              <SourceParameter reference="Metabolite_276"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_265" name="v18a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_265" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_272" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_239" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4508" name="k18a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_53" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_327">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_326">
              <SourceParameter reference="ModelValue_480"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_325">
              <SourceParameter reference="Metabolite_272"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_266" name="v18b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_266" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_269" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_239" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_269" stoichiometry="1"/>
          <Product metabolite="Metabolite_272" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4504" name="Kcat18b" value="1"/>
          <Constant key="Parameter_4507" name="Km18b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_328">
              <SourceParameter reference="ModelValue_426"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="ModelValue_453"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_324">
              <SourceParameter reference="Metabolite_239"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_329">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_330">
              <SourceParameter reference="Metabolite_269"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_267" name="v19a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_267" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_257" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_240" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_257" stoichiometry="1"/>
          <Product metabolite="Metabolite_273" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4500" name="Kcat19a" value="1"/>
          <Constant key="Parameter_4501" name="Km19a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_55" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_335">
              <SourceParameter reference="ModelValue_427"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_334">
              <SourceParameter reference="ModelValue_454"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_333">
              <SourceParameter reference="Metabolite_240"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_332">
              <SourceParameter reference="Metabolite_257"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_331">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_268" name="v19b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_268" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_240" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_273" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_277" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4503" name="Kcat19b" value="1"/>
          <Constant key="Parameter_4499" name="Km19b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_56" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_340">
              <SourceParameter reference="ModelValue_428"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_339">
              <SourceParameter reference="ModelValue_455"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_338">
              <SourceParameter reference="Metabolite_240"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_337">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_336">
              <SourceParameter reference="Metabolite_277"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_269" name="v19c" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_269" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_273" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_240" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4502" name="k19c" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_57" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_345">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_344">
              <SourceParameter reference="ModelValue_481"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_343">
              <SourceParameter reference="Metabolite_273"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_270" name="v2" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_270" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_259" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_235" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_257" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4156" name="k21" value="1"/>
          <Constant key="Parameter_4157" name="k22" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_46" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_291">
              <SourceParameter reference="Metabolite_235"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_290">
              <SourceParameter reference="Metabolite_257"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="Metabolite_259"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_292">
              <SourceParameter reference="ModelValue_482"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_293">
              <SourceParameter reference="ModelValue_483"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_271" name="v20" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_271" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_273" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_241" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_273" stoichiometry="1"/>
          <Product metabolite="Metabolite_242" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4160" name="Kcat20" value="1"/>
          <Constant key="Parameter_4155" name="Km20" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_47" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_299">
              <SourceParameter reference="ModelValue_429"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_298">
              <SourceParameter reference="ModelValue_456"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_297">
              <SourceParameter reference="Metabolite_241"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_296">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_295">
              <SourceParameter reference="Metabolite_273"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_272" name="v21" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_272" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_245" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_242" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_245" stoichiometry="1"/>
          <Product metabolite="Metabolite_241" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4159" name="Kcat21" value="1"/>
          <Constant key="Parameter_4158" name="Km21" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_48" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_303">
              <SourceParameter reference="ModelValue_430"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_302">
              <SourceParameter reference="ModelValue_457"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_301">
              <SourceParameter reference="Metabolite_242"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_300">
              <SourceParameter reference="Metabolite_245"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_294">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_273" name="v22a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_273" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_242" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_228" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_242" stoichiometry="1"/>
          <Product metabolite="Metabolite_264" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5189" name="Kcat22a" value="1"/>
          <Constant key="Parameter_5190" name="Km22a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_49" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_308">
              <SourceParameter reference="Metabolite_228"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_307">
              <SourceParameter reference="ModelValue_431"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_306">
              <SourceParameter reference="ModelValue_458"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_305">
              <SourceParameter reference="Metabolite_242"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_304">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_274" name="v22b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_274" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_264" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_228" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5192" name="Kcat22b" value="1"/>
          <Constant key="Parameter_5188" name="Km22b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_50" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_313">
              <SourceParameter reference="ModelValue_432"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_312">
              <SourceParameter reference="ModelValue_459"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_311">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_310">
              <SourceParameter reference="Metabolite_264"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_275" name="v23a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_275" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_257" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_232" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_257" stoichiometry="1"/>
          <Product metabolite="Metabolite_267" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5191" name="Kcat23a" value="1"/>
          <Constant key="Parameter_7557" name="Km23a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_51" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_316">
              <SourceParameter reference="Metabolite_232"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_315">
              <SourceParameter reference="ModelValue_433"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_314">
              <SourceParameter reference="ModelValue_460"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="Metabolite_257"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_317">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_276" name="v23b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_276" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_267" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_232" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7558" name="k23b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_39" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_264">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_263">
              <SourceParameter reference="ModelValue_484"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_262">
              <SourceParameter reference="Metabolite_267"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_277" name="v24" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_277" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_267" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_249" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_267" stoichiometry="1"/>
          <Product metabolite="Metabolite_276" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7560" name="Kcat24" value="1"/>
          <Constant key="Parameter_7556" name="Km24" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_40" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_265">
              <SourceParameter reference="ModelValue_434"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_250">
              <SourceParameter reference="ModelValue_461"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_261">
              <SourceParameter reference="Metabolite_249"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_267"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_278" name="v25" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_278" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_250" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_276" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_250" stoichiometry="1"/>
          <Product metabolite="Metabolite_249" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7559" name="Kcat25" value="1"/>
          <Constant key="Parameter_4298" name="Km25" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="ModelValue_435"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="ModelValue_462"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="Metabolite_250"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_269">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="Metabolite_276"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_279" name="v26a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_279" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_237" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_237" stoichiometry="1"/>
          <Product metabolite="Metabolite_243" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4299" name="V26a" value="1"/>
          <Constant key="Parameter_4301" name="k26a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_42" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_277">
              <SourceParameter reference="Metabolite_237"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_276">
              <SourceParameter reference="ModelValue_471"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="ModelValue_485"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_280" name="v26b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_280" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_243" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_260" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4297" name="k26b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_43" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="Metabolite_243"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_279">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="ModelValue_486"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_281" name="v27a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_281" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_269" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_237" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_269" stoichiometry="1"/>
          <Product metabolite="Metabolite_270" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4300" name="Kcat27a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_44" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="Metabolite_237"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_281">
              <SourceParameter reference="ModelValue_436"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="Metabolite_269"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_282" name="v27b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_282" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_264" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_237" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_264" stoichiometry="1"/>
          <Product metabolite="Metabolite_270" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5616" name="Kcat27b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_45" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="Metabolite_237"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="ModelValue_437"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="Metabolite_264"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_283" name="v27c" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_283" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_246" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_246" stoichiometry="1"/>
          <Product metabolite="Metabolite_237" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5617" name="k27c" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_65" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_370">
              <SourceParameter reference="Metabolite_246"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_371">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_372">
              <SourceParameter reference="ModelValue_487"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_284" name="v27d" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_284" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_270" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_237" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5619" name="Kcat27d" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_66" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_378">
              <SourceParameter reference="ModelValue_438"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_377">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_376">
              <SourceParameter reference="Metabolite_270"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_285" name="v28" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_285" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_234" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_233" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5615" name="W" value="1"/>
          <Constant key="Parameter_5618" name="k28" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_67" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_381">
              <SourceParameter reference="Metabolite_234"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_380">
              <SourceParameter reference="ModelValue_474"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_379">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_382">
              <SourceParameter reference="ModelValue_488"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_286" name="v29" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_286" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_233" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_234" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6539" name="k29" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_68" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_386">
              <SourceParameter reference="Metabolite_233"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_385">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_384">
              <SourceParameter reference="ModelValue_489"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_287" name="v3" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_287" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_259" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_258" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6540" name="k3" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_69" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_388">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_387">
              <SourceParameter reference="Metabolite_259"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_383">
              <SourceParameter reference="ModelValue_490"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_288" name="v30" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_288" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_233" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_226" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_237" stoichiometry="1"/>
          <Product metabolite="Metabolite_225" stoichiometry="1"/>
          <Product metabolite="Metabolite_233" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6542" name="k30" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_70" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_391">
              <SourceParameter reference="Metabolite_226"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_390">
              <SourceParameter reference="Metabolite_233"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_389">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_392">
              <SourceParameter reference="ModelValue_491"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_289" name="v31" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_289" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_225" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_237" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_226" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6538" name="k311" value="1"/>
          <Constant key="Parameter_6541" name="k312" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_91" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_482">
              <SourceParameter reference="Metabolite_225"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_481">
              <SourceParameter reference="Metabolite_226"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_480">
              <SourceParameter reference="Metabolite_237"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_479">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_478">
              <SourceParameter reference="ModelValue_492"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_483">
              <SourceParameter reference="ModelValue_493"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_290" name="v32a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_290" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_226" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_261" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6534" name="k32a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_58" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_346">
              <SourceParameter reference="Metabolite_226"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_341">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_342">
              <SourceParameter reference="ModelValue_494"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_291" name="v32b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_291" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_261" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_226" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6535" name="k32b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_59" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_349">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_348">
              <SourceParameter reference="ModelValue_495"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="Metabolite_261"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_292" name="v33a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_292" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_224" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_229" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_225" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6537" name="k33a1" value="1"/>
          <Constant key="Parameter_6533" name="k33a2" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_60" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="Metabolite_224"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="Metabolite_225"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_350">
              <SourceParameter reference="Metabolite_229"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_353">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="ModelValue_496"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_355">
              <SourceParameter reference="ModelValue_497"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_293" name="v33b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_293" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_229" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_260" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6536" name="k33b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_61" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_361">
              <SourceParameter reference="Metabolite_229"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_360">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_359">
              <SourceParameter reference="ModelValue_498"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_294" name="v33c" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_294" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_230" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_255" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_230" stoichiometry="1"/>
          <Product metabolite="Metabolite_255" stoichiometry="1"/>
          <Product metabolite="Metabolite_229" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5291" name="k33c1" value="1"/>
          <Constant key="Parameter_5292" name="k33c2" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_62" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="Metabolite_230"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_357">
              <SourceParameter reference="Metabolite_255"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_362">
              <SourceParameter reference="ModelValue_499"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_363">
              <SourceParameter reference="ModelValue_500"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_295" name="v34" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_295" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_230" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_261" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_262" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5296" name="k341" value="1"/>
          <Constant key="Parameter_5290" name="k342" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_63" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_368">
              <SourceParameter reference="Metabolite_230"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_367">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_366">
              <SourceParameter reference="ModelValue_501"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_365">
              <SourceParameter reference="ModelValue_502"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_364">
              <SourceParameter reference="Metabolite_261"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_369">
              <SourceParameter reference="Metabolite_262"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_296" name="v35" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_296" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_262" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_263" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5295" name="k35" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_64" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_375">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_374">
              <SourceParameter reference="ModelValue_503"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_373">
              <SourceParameter reference="Metabolite_262"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_297" name="v36" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_297" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_263" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_265" stoichiometry="1"/>
          <Product metabolite="Metabolite_261" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5294" name="k36" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_71" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_396">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_395">
              <SourceParameter reference="ModelValue_504"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_394">
              <SourceParameter reference="Metabolite_263"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_298" name="v37a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_298" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_230" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_224" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_227" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5293" name="k37a1" value="1"/>
          <Constant key="Parameter_4411" name="k37a2" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_72" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_398">
              <SourceParameter reference="Metabolite_224"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_397">
              <SourceParameter reference="Metabolite_227"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_393">
              <SourceParameter reference="Metabolite_230"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_399">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_400">
              <SourceParameter reference="ModelValue_505"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_401">
              <SourceParameter reference="ModelValue_506"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_299" name="v37b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_299" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_260" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_230" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4412" name="V37b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_73" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_407">
              <SourceParameter reference="ModelValue_472"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_406">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_300" name="v37c" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_300" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_230" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_260" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4414" name="k37c" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_74" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_404">
              <SourceParameter reference="Metabolite_230"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_405">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_403">
              <SourceParameter reference="ModelValue_507"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_301" name="v38" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_301" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_254" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_230" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_255" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4410" name="k381" value="1"/>
          <Constant key="Parameter_4413" name="k382" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_75" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_409">
              <SourceParameter reference="Metabolite_230"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_408">
              <SourceParameter reference="Metabolite_254"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_402">
              <SourceParameter reference="Metabolite_255"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_410">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_411">
              <SourceParameter reference="ModelValue_508"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_412">
              <SourceParameter reference="ModelValue_509"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_302" name="v39" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_302" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_255" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_256" stoichiometry="1"/>
          <Product metabolite="Metabolite_255" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6713" name="Km39" value="1"/>
          <Constant key="Parameter_6714" name="k39" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_76" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_463"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_417">
              <SourceParameter reference="Metabolite_255"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_416">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_415">
              <SourceParameter reference="ModelValue_510"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_303" name="v4" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_303" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_257" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_258" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6716" name="k4" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_77" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_420">
              <SourceParameter reference="Metabolite_257"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_419">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_413">
              <SourceParameter reference="ModelValue_511"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_304" name="v40" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_304" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_256" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_260" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6712" name="k40" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_78" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_422">
              <SourceParameter reference="Metabolite_256"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_421">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_414">
              <SourceParameter reference="ModelValue_512"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_305" name="v41" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_305" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_265" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_260" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_6715" name="k41" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_79" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_425">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_424">
              <SourceParameter reference="ModelValue_513"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_423">
              <SourceParameter reference="Metabolite_265"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_306" name="v5" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_306" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_243" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_269" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_257" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_253" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_243" stoichiometry="1"/>
          <Product metabolite="Metabolite_269" stoichiometry="1"/>
          <Product metabolite="Metabolite_257" stoichiometry="1"/>
          <Product metabolite="Metabolite_278" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5063" name="k51" value="1"/>
          <Constant key="Parameter_5064" name="k52" value="1"/>
          <Constant key="Parameter_5066" name="k53" value="1"/>
          <Constant key="Parameter_5062" name="k54" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_80" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_428">
              <SourceParameter reference="Metabolite_243"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_257"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_426">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_429">
              <SourceParameter reference="ModelValue_514"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_430">
              <SourceParameter reference="ModelValue_515"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_431">
              <SourceParameter reference="ModelValue_516"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_432">
              <SourceParameter reference="ModelValue_517"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_433">
              <SourceParameter reference="Metabolite_269"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_307" name="v6a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_307" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_278" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_253" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5065" name="k6a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_81" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_441">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_440">
              <SourceParameter reference="ModelValue_518"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_439">
              <SourceParameter reference="Metabolite_278"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_308" name="v6b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_308" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_272" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_278" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_272" stoichiometry="1"/>
          <Product metabolite="Metabolite_253" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5940" name="Kcat6b" value="1"/>
          <Constant key="Parameter_5941" name="Km6b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_82" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_436">
              <SourceParameter reference="ModelValue_439"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_437">
              <SourceParameter reference="ModelValue_464"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_438">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_435">
              <SourceParameter reference="Metabolite_272"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_434">
              <SourceParameter reference="Metabolite_278"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_309" name="v7" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_309" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_278" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_251" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_278" stoichiometry="1"/>
          <Product metabolite="Metabolite_277" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5943" name="Kcat7" value="1"/>
          <Constant key="Parameter_5939" name="Km7" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_83" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_446">
              <SourceParameter reference="ModelValue_440"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_445">
              <SourceParameter reference="ModelValue_465"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_444">
              <SourceParameter reference="Metabolite_251"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_443">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_442">
              <SourceParameter reference="Metabolite_278"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_310" name="v8a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_310" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_260" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_251" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_5942" name="V8a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_97" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_512">
              <SourceParameter reference="ModelValue_473"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_511">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_311" name="v8b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_311" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_252" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_277" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_252" stoichiometry="1"/>
          <Product metabolite="Metabolite_251" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4181" name="Kcat8b" value="1"/>
          <Constant key="Parameter_4182" name="Km8b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_98" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_509">
              <SourceParameter reference="ModelValue_441"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_510">
              <SourceParameter reference="ModelValue_466"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_508">
              <SourceParameter reference="Metabolite_252"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_513">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_514">
              <SourceParameter reference="Metabolite_277"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_312" name="v9a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_312" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_277" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_247" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_277" stoichiometry="1"/>
          <Product metabolite="Metabolite_275" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4185" name="Kcat9a" value="1"/>
          <Constant key="Parameter_4180" name="Km9a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_99" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_519">
              <SourceParameter reference="ModelValue_442"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_518">
              <SourceParameter reference="ModelValue_467"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_517">
              <SourceParameter reference="Metabolite_247"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_516">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_515">
              <SourceParameter reference="Metabolite_277"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_313" name="v9b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_313" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_256" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_247" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_256" stoichiometry="1"/>
          <Product metabolite="Metabolite_275" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4184" name="Km9b" value="1"/>
          <Constant key="Parameter_4183" name="W" value="1"/>
          <Constant key="Parameter_4344" name="k9b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_100" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_524">
              <SourceParameter reference="ModelValue_468"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_523">
              <SourceParameter reference="Metabolite_247"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_522">
              <SourceParameter reference="ModelValue_474"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_521">
              <SourceParameter reference="Metabolite_256"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_520">
              <SourceParameter reference="Compartment_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_525">
              <SourceParameter reference="ModelValue_519"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_314" name="VEM" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_266" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_231" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_279" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4345" name="Kcat" value="0.1"/>
          <Constant key="Parameter_4348" name="km" value="100"/>
        </ListOfConstants>
        <KineticLaw function="Function_101" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_531">
              <SourceParameter reference="Parameter_4345"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_530">
              <SourceParameter reference="Metabolite_279"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_529">
              <SourceParameter reference="Metabolite_266"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_528">
              <SourceParameter reference="Parameter_4348"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_5">
      <ModelParameterSet key="ModelParameterSet_5" name="Initial State">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelParameterSet_5">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=_1" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[APC]" value="58175094119758000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[APCAxin]" value="903321268500" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[APCAxinGSK3B]" value="4576827760400" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[APCBCatenin]" value="2071135004416800" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Akt]" value="1.204428358e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Axin]" value="481771343200" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[BCatenin]" value="25727794155238000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[BRaf]" value="1.204428358e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[C3G]" value="3.011070895e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Dsha]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Dshi]" value="60221417900000000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[EGF]" value="3.613285074e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[ERK]" value="1.5657568654e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[GSK3B]" value="29590998113523000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[MEK]" value="4.0950564172e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[P90Rsk]" value="36132850740000000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[PI3K]" value="60221417900000000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[PIP2]" value="4.215499253e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[PIP3]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[PKCD]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[PP2A]" value="1.4453140296e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[PTEN]" value="1.6259782833e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[RKIP]" value="12591696268711004" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Raf1]" value="60221417900000000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[RafPPtase]" value="36132850740000000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Rap1]" value="1.204428358e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Rap1Gap]" value="7226570148000000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Ras]" value="60221417900000000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[RasGap]" value="60221417900000000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[SOS]" value="60221417900000000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[TCF]" value="3726441118234100" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[TCFBCatenin]" value="5306771566765899" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[X]" value="6180524119077000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[bEGFR]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[dEGFR]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[fEGFR]" value="1.806642537e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[null]" value="0" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pAPCpAxinGSK3B]" value="9213876938700" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pAPCpAxinGSK3BBCatenin]" value="1204428358000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pAPCpAxinGSK3BpBCatenin]" value="1204428358000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pAkt]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pBCatenin]" value="595047830269900" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pBRaf]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pC3G]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pEGFR]" value="30110708950000" type="Species" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pERK]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pGSK3B]" value="515158097283760.06" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pMEK]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pP90Rsk]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pPI3K]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pRKIP]" value="519048400880100" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pRaf1]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pRap1]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pRas]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pSOS]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Vem]" value="6022141790000000" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat10a]" value="0.12633" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat10b]" value="15.1212" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat11a]" value="185.75999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat12]" value="2.8323999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat13]" value="9.8536999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat14]" value="8.8911999999999995" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat16a]" value="0.8841" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat16b]" value="0.8841" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat17a]" value="0.12633" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat17b]" value="15.1212" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat18b]" value="0.02137" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat19a]" value="10.6737" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat19b]" value="0.077109999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat20]" value="4" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat21]" value="5.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat22a]" value="0.33000000000000002" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat22b]" value="48.667000000000002" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat23a]" value="694.73000000000002" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat24]" value="32.344000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat25]" value="1509.4000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat27a]" value="0.002" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat27b]" value="0.045960000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat27d]" value="0.01541" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat6b]" value="1611.97" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat7]" value="32.643999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat8b]" value="1509.3599999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Kcat9a]" value="0.88409599999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km10a]" value="1061.7" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km10b]" value="119355" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km11a]" value="4768400" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km12]" value="518750" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km13]" value="1007300" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km14]" value="3496500" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km16a]" value="62645" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km16b]" value="62464.599999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km17a]" value="1061.71" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km17b]" value="119355" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km18b]" value="763523" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km19a]" value="184912" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km19b]" value="272056" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km20]" value="4" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km21]" value="0.080000000000000002" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km22a]" value="100" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km22b]" value="100" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km23a]" value="6086100" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km24]" value="35954.300000000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km25]" value="1432400" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km39]" value="15" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km6b]" value="896896" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km7]" value="35954.300000000003" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km8b]" value="1432410" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km9a]" value="62464.599999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[Km9b]" value="15" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[V1]" value="100" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[V15b]" value="4" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[V26a]" value="0.0015399999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[V37b]" value="0.0070499999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[V8a]" value="0.0717" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[W]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[defaultcompartment]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k11b1]" value="1.1167e-05" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k11b2]" value="120" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k15a]" value="1.3" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k15c]" value="0.0019300000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k18a]" value="0.0050000000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k19c]" value="0.0050000000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k21]" value="2.18503e-05" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k22]" value="0.121008" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k23b]" value="2.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k26a]" value="20" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k26b]" value="0.00038499999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k27c]" value="0.00014999999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k28]" value="0.0030000000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k29]" value="0.0030000000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k3]" value="0.00125" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k30]" value="0.00083299999999999997" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k311]" value="0.0015150000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k312]" value="0.01515" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k32a]" value="0.00445" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k32b]" value="0.0022169999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k33a1]" value="0.016670000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k33a2]" value="0.83330000000000004" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k33b]" value="0.0027829999999999999" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k33c1]" value="1.37e-06" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k33c2]" value="1.667e-08" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k341]" value="0.016670000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k342]" value="2" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k35]" value="3.4329999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k36]" value="3.4329999999999998" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k37a1]" value="0.016670000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k37a2]" value="20" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k37c]" value="4.2830000000000003e-06" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k381]" value="0.016670000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k382]" value="0.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k39]" value="0.01" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k4]" value="0.20000000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k40]" value="0.00025000000000000001" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k41]" value="0.0069499999999999996" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k51]" value="0.0034650000000000002" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k52]" value="3.8500000000000001e-05" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k53]" value="0.00028833" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k54]" value="1.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k6a]" value="2.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Values[k9b]" value="0.025000000000000001" type="ModelValue" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v1]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v10a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v10b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v11a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v11b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v12]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v13]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v14]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v15a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v15b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v15c]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v16a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v16b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v18a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v18b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v19a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v19b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v19c]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v2]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v20]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v21]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v22a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v22b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v23a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v23b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v24]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v25]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v26a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v26b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v27a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v27b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v27c]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v27d]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v28]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v29]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v3]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v30]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v31]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v32a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v32b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v33a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v33b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v33c]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v34]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v35]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v36]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v37a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v37b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v37c]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v38]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v39]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v4]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v40]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v41]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v5]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v6a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v6b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v7]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v8a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v8b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v9a]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[v9b]" type="Reaction">
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[VEM]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=_1,Vector=Reactions[VEM],ParameterGroup=Parameters,Parameter=Kcat" value="0.10000000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=_1,Vector=Reactions[VEM],ParameterGroup=Parameters,Parameter=km" value="100" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_5"/>
      <StateTemplateVariable objectReference="Metabolite_237"/>
      <StateTemplateVariable objectReference="Metabolite_230"/>
      <StateTemplateVariable objectReference="Metabolite_247"/>
      <StateTemplateVariable objectReference="Metabolite_261"/>
      <StateTemplateVariable objectReference="Metabolite_229"/>
      <StateTemplateVariable objectReference="Metabolite_231"/>
      <StateTemplateVariable objectReference="Metabolite_238"/>
      <StateTemplateVariable objectReference="Metabolite_240"/>
      <StateTemplateVariable objectReference="Metabolite_246"/>
      <StateTemplateVariable objectReference="Metabolite_251"/>
      <StateTemplateVariable objectReference="Metabolite_253"/>
      <StateTemplateVariable objectReference="Metabolite_259"/>
      <StateTemplateVariable objectReference="Metabolite_226"/>
      <StateTemplateVariable objectReference="Metabolite_239"/>
      <StateTemplateVariable objectReference="Metabolite_228"/>
      <StateTemplateVariable objectReference="Metabolite_241"/>
      <StateTemplateVariable objectReference="Metabolite_243"/>
      <StateTemplateVariable objectReference="Metabolite_232"/>
      <StateTemplateVariable objectReference="Metabolite_236"/>
      <StateTemplateVariable objectReference="Metabolite_249"/>
      <StateTemplateVariable objectReference="Metabolite_233"/>
      <StateTemplateVariable objectReference="Metabolite_256"/>
      <StateTemplateVariable objectReference="Metabolite_257"/>
      <StateTemplateVariable objectReference="Metabolite_263"/>
      <StateTemplateVariable objectReference="Metabolite_224"/>
      <StateTemplateVariable objectReference="Metabolite_265"/>
      <StateTemplateVariable objectReference="Metabolite_270"/>
      <StateTemplateVariable objectReference="Metabolite_254"/>
      <StateTemplateVariable objectReference="Metabolite_274"/>
      <StateTemplateVariable objectReference="Metabolite_277"/>
      <StateTemplateVariable objectReference="Metabolite_225"/>
      <StateTemplateVariable objectReference="Metabolite_258"/>
      <StateTemplateVariable objectReference="Metabolite_235"/>
      <StateTemplateVariable objectReference="Metabolite_262"/>
      <StateTemplateVariable objectReference="Metabolite_227"/>
      <StateTemplateVariable objectReference="Metabolite_266"/>
      <StateTemplateVariable objectReference="Metabolite_273"/>
      <StateTemplateVariable objectReference="Metabolite_264"/>
      <StateTemplateVariable objectReference="Metabolite_276"/>
      <StateTemplateVariable objectReference="Metabolite_234"/>
      <StateTemplateVariable objectReference="Metabolite_267"/>
      <StateTemplateVariable objectReference="Metabolite_278"/>
      <StateTemplateVariable objectReference="Metabolite_275"/>
      <StateTemplateVariable objectReference="Metabolite_255"/>
      <StateTemplateVariable objectReference="Metabolite_269"/>
      <StateTemplateVariable objectReference="Metabolite_271"/>
      <StateTemplateVariable objectReference="Metabolite_242"/>
      <StateTemplateVariable objectReference="Metabolite_272"/>
      <StateTemplateVariable objectReference="Metabolite_260"/>
      <StateTemplateVariable objectReference="Metabolite_268"/>
      <StateTemplateVariable objectReference="Metabolite_244"/>
      <StateTemplateVariable objectReference="Metabolite_245"/>
      <StateTemplateVariable objectReference="Metabolite_248"/>
      <StateTemplateVariable objectReference="Metabolite_250"/>
      <StateTemplateVariable objectReference="Metabolite_252"/>
      <StateTemplateVariable objectReference="Metabolite_279"/>
      <StateTemplateVariable objectReference="Compartment_4"/>
      <StateTemplateVariable objectReference="ModelValue_416"/>
      <StateTemplateVariable objectReference="ModelValue_417"/>
      <StateTemplateVariable objectReference="ModelValue_418"/>
      <StateTemplateVariable objectReference="ModelValue_419"/>
      <StateTemplateVariable objectReference="ModelValue_420"/>
      <StateTemplateVariable objectReference="ModelValue_421"/>
      <StateTemplateVariable objectReference="ModelValue_422"/>
      <StateTemplateVariable objectReference="ModelValue_423"/>
      <StateTemplateVariable objectReference="ModelValue_424"/>
      <StateTemplateVariable objectReference="ModelValue_425"/>
      <StateTemplateVariable objectReference="ModelValue_426"/>
      <StateTemplateVariable objectReference="ModelValue_427"/>
      <StateTemplateVariable objectReference="ModelValue_428"/>
      <StateTemplateVariable objectReference="ModelValue_429"/>
      <StateTemplateVariable objectReference="ModelValue_430"/>
      <StateTemplateVariable objectReference="ModelValue_431"/>
      <StateTemplateVariable objectReference="ModelValue_432"/>
      <StateTemplateVariable objectReference="ModelValue_433"/>
      <StateTemplateVariable objectReference="ModelValue_434"/>
      <StateTemplateVariable objectReference="ModelValue_435"/>
      <StateTemplateVariable objectReference="ModelValue_436"/>
      <StateTemplateVariable objectReference="ModelValue_437"/>
      <StateTemplateVariable objectReference="ModelValue_438"/>
      <StateTemplateVariable objectReference="ModelValue_439"/>
      <StateTemplateVariable objectReference="ModelValue_440"/>
      <StateTemplateVariable objectReference="ModelValue_441"/>
      <StateTemplateVariable objectReference="ModelValue_442"/>
      <StateTemplateVariable objectReference="ModelValue_443"/>
      <StateTemplateVariable objectReference="ModelValue_444"/>
      <StateTemplateVariable objectReference="ModelValue_445"/>
      <StateTemplateVariable objectReference="ModelValue_446"/>
      <StateTemplateVariable objectReference="ModelValue_447"/>
      <StateTemplateVariable objectReference="ModelValue_448"/>
      <StateTemplateVariable objectReference="ModelValue_449"/>
      <StateTemplateVariable objectReference="ModelValue_450"/>
      <StateTemplateVariable objectReference="ModelValue_451"/>
      <StateTemplateVariable objectReference="ModelValue_452"/>
      <StateTemplateVariable objectReference="ModelValue_453"/>
      <StateTemplateVariable objectReference="ModelValue_454"/>
      <StateTemplateVariable objectReference="ModelValue_455"/>
      <StateTemplateVariable objectReference="ModelValue_456"/>
      <StateTemplateVariable objectReference="ModelValue_457"/>
      <StateTemplateVariable objectReference="ModelValue_458"/>
      <StateTemplateVariable objectReference="ModelValue_459"/>
      <StateTemplateVariable objectReference="ModelValue_460"/>
      <StateTemplateVariable objectReference="ModelValue_461"/>
      <StateTemplateVariable objectReference="ModelValue_462"/>
      <StateTemplateVariable objectReference="ModelValue_463"/>
      <StateTemplateVariable objectReference="ModelValue_464"/>
      <StateTemplateVariable objectReference="ModelValue_465"/>
      <StateTemplateVariable objectReference="ModelValue_466"/>
      <StateTemplateVariable objectReference="ModelValue_467"/>
      <StateTemplateVariable objectReference="ModelValue_468"/>
      <StateTemplateVariable objectReference="ModelValue_469"/>
      <StateTemplateVariable objectReference="ModelValue_470"/>
      <StateTemplateVariable objectReference="ModelValue_471"/>
      <StateTemplateVariable objectReference="ModelValue_472"/>
      <StateTemplateVariable objectReference="ModelValue_473"/>
      <StateTemplateVariable objectReference="ModelValue_474"/>
      <StateTemplateVariable objectReference="ModelValue_475"/>
      <StateTemplateVariable objectReference="ModelValue_476"/>
      <StateTemplateVariable objectReference="ModelValue_477"/>
      <StateTemplateVariable objectReference="ModelValue_478"/>
      <StateTemplateVariable objectReference="ModelValue_479"/>
      <StateTemplateVariable objectReference="ModelValue_480"/>
      <StateTemplateVariable objectReference="ModelValue_481"/>
      <StateTemplateVariable objectReference="ModelValue_482"/>
      <StateTemplateVariable objectReference="ModelValue_483"/>
      <StateTemplateVariable objectReference="ModelValue_484"/>
      <StateTemplateVariable objectReference="ModelValue_485"/>
      <StateTemplateVariable objectReference="ModelValue_486"/>
      <StateTemplateVariable objectReference="ModelValue_487"/>
      <StateTemplateVariable objectReference="ModelValue_488"/>
      <StateTemplateVariable objectReference="ModelValue_489"/>
      <StateTemplateVariable objectReference="ModelValue_490"/>
      <StateTemplateVariable objectReference="ModelValue_491"/>
      <StateTemplateVariable objectReference="ModelValue_492"/>
      <StateTemplateVariable objectReference="ModelValue_493"/>
      <StateTemplateVariable objectReference="ModelValue_494"/>
      <StateTemplateVariable objectReference="ModelValue_495"/>
      <StateTemplateVariable objectReference="ModelValue_496"/>
      <StateTemplateVariable objectReference="ModelValue_497"/>
      <StateTemplateVariable objectReference="ModelValue_498"/>
      <StateTemplateVariable objectReference="ModelValue_499"/>
      <StateTemplateVariable objectReference="ModelValue_500"/>
      <StateTemplateVariable objectReference="ModelValue_501"/>
      <StateTemplateVariable objectReference="ModelValue_502"/>
      <StateTemplateVariable objectReference="ModelValue_503"/>
      <StateTemplateVariable objectReference="ModelValue_504"/>
      <StateTemplateVariable objectReference="ModelValue_505"/>
      <StateTemplateVariable objectReference="ModelValue_506"/>
      <StateTemplateVariable objectReference="ModelValue_507"/>
      <StateTemplateVariable objectReference="ModelValue_508"/>
      <StateTemplateVariable objectReference="ModelValue_509"/>
      <StateTemplateVariable objectReference="ModelValue_510"/>
      <StateTemplateVariable objectReference="ModelValue_511"/>
      <StateTemplateVariable objectReference="ModelValue_512"/>
      <StateTemplateVariable objectReference="ModelValue_513"/>
      <StateTemplateVariable objectReference="ModelValue_514"/>
      <StateTemplateVariable objectReference="ModelValue_515"/>
      <StateTemplateVariable objectReference="ModelValue_516"/>
      <StateTemplateVariable objectReference="ModelValue_517"/>
      <StateTemplateVariable objectReference="ModelValue_518"/>
      <StateTemplateVariable objectReference="ModelValue_519"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 29590998113523000 25727794155238000 60221417900000000 9213876938700 481771343200 1.204428358e+17 4.0950564172e+17 60221417900000000 12591696268711004 60221417900000000 60221417900000000 1.806642537e+17 4576827760400 36132850740000000 1.204428358e+17 4.215499253e+17 0 3.011070895e+17 1.5657568654e+17 1.204428358e+17 0 6180524119077000 0 1204428358000 58175094119758000 595047830269900 515158097283760.06 3726441118234100 519048400880100 0 903321268500 0 3.613285074e+17 1204428358000 2071135004416800 0 0 0 0 60221417900000000 0 0 0 5306771566765899 0 0 0 0 0 30110708950000 1.4453140296e+17 1.6259782833e+17 36132850740000000 7226570148000000 60221417900000000 6022141790000000 1 0.12633 15.1212 185.75999999999999 2.8323999999999998 9.8536999999999999 8.8911999999999995 0.8841 0.8841 0.12633 15.1212 0.02137 10.6737 0.077109999999999998 4 5.5 0.33000000000000002 48.667000000000002 694.73000000000002 32.344000000000001 1509.4000000000001 0.002 0.045960000000000001 0.01541 1611.97 32.643999999999998 1509.3599999999999 0.88409599999999999 1061.7 119355 4768400 518750 1007300 3496500 62645 62464.599999999999 1061.71 119355 763523 184912 272056 4 0.080000000000000002 100 100 6086100 35954.300000000003 1432400 15 896896 35954.300000000003 1432410 62464.599999999999 15 100 4 0.0015399999999999999 0.0070499999999999998 0.0717 0 1 1.1167e-05 120 1.3 0.0019300000000000001 0.0050000000000000001 0.0050000000000000001 2.18503e-05 0.121008 2.5 20 0.00038499999999999998 0.00014999999999999999 0.0030000000000000001 0.0030000000000000001 0.00125 0.00083299999999999997 0.0015150000000000001 0.01515 0.00445 0.0022169999999999998 0.016670000000000001 0.83330000000000004 0.0027829999999999999 1.37e-06 1.667e-08 0.016670000000000001 2 3.4329999999999998 3.4329999999999998 0.016670000000000001 20 4.2830000000000003e-06 0.016670000000000001 0.5 0.01 0.20000000000000001 0.00025000000000000001 0.0069499999999999996 0.0034650000000000002 3.8500000000000001e-05 0.00028833 1.5 2.5 0.025000000000000001 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_70" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_55" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="1"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="0"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
        <Parameter name="Target Criterion" type="string" value="Distance and Rate"/>
      </Method>
    </Task>
    <Task key="Task_71" name="Time-Course" type="timeCourse" scheduled="true" updateModel="false">
      <Report reference="Report_56" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="15000"/>
        <Parameter name="StepSize" type="float" value="1"/>
        <Parameter name="Duration" type="float" value="15000"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_72" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
          <ParameterGroup name="ScanItem">
            <Parameter name="Number of steps" type="unsignedInteger" value="2"/>
            <Parameter name="Type" type="unsignedInteger" value="1"/>
            <Parameter name="Object" type="cn" value="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Vem],Reference=InitialConcentration"/>
            <Parameter name="Minimum" type="float" value="0"/>
            <Parameter name="Maximum" type="float" value="10"/>
            <Parameter name="log" type="bool" value="0"/>
            <Parameter name="Values" type="string" value=""/>
            <Parameter name="Use Values" type="bool" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
        <Parameter name="Output in subtask" type="bool" value="0"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
        <Parameter name="Continue on Error" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_73" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_57" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_74" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_58" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
      </Problem>
      <Method name="Random Search" type="RandomSearch">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Iterations" type="unsignedInteger" value="100000"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_75" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_59" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <Parameter name="Use Time Sens" type="bool" value="0"/>
        <Parameter name="Time-Sens" type="cn" value=""/>
        <ParameterGroup name="Experiment Set">
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
      </Problem>
      <Method name="Evolutionary Programming" type="EvolutionaryProgram">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
        <Parameter name="Stop after # Stalled Generations" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_76" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_60" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_70"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Use Reder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_77" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_61" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
        <Parameter name="DivergenceRequested" type="bool" value="1"/>
        <Parameter name="TransientTime" type="float" value="0"/>
      </Problem>
      <Method name="Wolf Method" type="WolfMethod">
        <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
        <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_78" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_62" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
      </Problem>
      <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
        <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="0.0001"/>
      </Method>
    </Task>
    <Task key="Task_79" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_63" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="1"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value=""/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="7"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="41"/>
          </ParameterGroup>
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="9.9999999999999998e-13"/>
      </Method>
    </Task>
    <Task key="Task_80" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Report reference="Report_64" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_81" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <Parameter name="LimitCrossings" type="bool" value="0"/>
        <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitOutTime" type="bool" value="0"/>
        <Parameter name="LimitOutCrossings" type="bool" value="0"/>
        <Parameter name="PositiveDirection" type="bool" value="1"/>
        <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
        <Parameter name="ConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="9.9999999999999995e-07"/>
        <ParameterText name="TriggerExpression" type="expression">
          
        </ParameterText>
        <Parameter name="SingleVariable" type="cn" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_82" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_65" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_70"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
    <Task key="Task_83" name="Time-Course Sensitivities" type="timeSensitivities" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <ParameterGroup name="ListOfParameters">
        </ParameterGroup>
        <ParameterGroup name="ListOfTargets">
        </ParameterGroup>
      </Problem>
      <Method name="LSODA Sensitivities" type="Sensitivities(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_55" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_56" name="Time-Course" taskType="timeCourse" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_57" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_58" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_59" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_60" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_61" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_62" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_63" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_64" name="Moieties" taskType="moieties" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_65" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
  </ListOfReports>
  <SBMLReference file="ERK_Akt_Wnt_SBML-BRafMut.xml">
    <SBMLMap SBMLid="APC" COPASIkey="Metabolite_224"/>
    <SBMLMap SBMLid="APCAxin" COPASIkey="Metabolite_225"/>
    <SBMLMap SBMLid="APCAxinGSK3B" COPASIkey="Metabolite_226"/>
    <SBMLMap SBMLid="APCBCatenin" COPASIkey="Metabolite_227"/>
    <SBMLMap SBMLid="Akt" COPASIkey="Metabolite_228"/>
    <SBMLMap SBMLid="Axin" COPASIkey="Metabolite_229"/>
    <SBMLMap SBMLid="BCatenin" COPASIkey="Metabolite_230"/>
    <SBMLMap SBMLid="BRaf" COPASIkey="Metabolite_231"/>
    <SBMLMap SBMLid="C3G" COPASIkey="Metabolite_232"/>
    <SBMLMap SBMLid="Dsha" COPASIkey="Metabolite_233"/>
    <SBMLMap SBMLid="Dshi" COPASIkey="Metabolite_234"/>
    <SBMLMap SBMLid="EGF" COPASIkey="Metabolite_235"/>
    <SBMLMap SBMLid="ERK" COPASIkey="Metabolite_236"/>
    <SBMLMap SBMLid="GSK3B" COPASIkey="Metabolite_237"/>
    <SBMLMap SBMLid="Kcat10a" COPASIkey="ModelValue_416"/>
    <SBMLMap SBMLid="Kcat10b" COPASIkey="ModelValue_417"/>
    <SBMLMap SBMLid="Kcat11a" COPASIkey="ModelValue_418"/>
    <SBMLMap SBMLid="Kcat12" COPASIkey="ModelValue_419"/>
    <SBMLMap SBMLid="Kcat13" COPASIkey="ModelValue_420"/>
    <SBMLMap SBMLid="Kcat14" COPASIkey="ModelValue_421"/>
    <SBMLMap SBMLid="Kcat16a" COPASIkey="ModelValue_422"/>
    <SBMLMap SBMLid="Kcat16b" COPASIkey="ModelValue_423"/>
    <SBMLMap SBMLid="Kcat17a" COPASIkey="ModelValue_424"/>
    <SBMLMap SBMLid="Kcat17b" COPASIkey="ModelValue_425"/>
    <SBMLMap SBMLid="Kcat18b" COPASIkey="ModelValue_426"/>
    <SBMLMap SBMLid="Kcat19a" COPASIkey="ModelValue_427"/>
    <SBMLMap SBMLid="Kcat19b" COPASIkey="ModelValue_428"/>
    <SBMLMap SBMLid="Kcat20" COPASIkey="ModelValue_429"/>
    <SBMLMap SBMLid="Kcat21" COPASIkey="ModelValue_430"/>
    <SBMLMap SBMLid="Kcat22a" COPASIkey="ModelValue_431"/>
    <SBMLMap SBMLid="Kcat22b" COPASIkey="ModelValue_432"/>
    <SBMLMap SBMLid="Kcat23a" COPASIkey="ModelValue_433"/>
    <SBMLMap SBMLid="Kcat24" COPASIkey="ModelValue_434"/>
    <SBMLMap SBMLid="Kcat25" COPASIkey="ModelValue_435"/>
    <SBMLMap SBMLid="Kcat27a" COPASIkey="ModelValue_436"/>
    <SBMLMap SBMLid="Kcat27b" COPASIkey="ModelValue_437"/>
    <SBMLMap SBMLid="Kcat27d" COPASIkey="ModelValue_438"/>
    <SBMLMap SBMLid="Kcat6b" COPASIkey="ModelValue_439"/>
    <SBMLMap SBMLid="Kcat7" COPASIkey="ModelValue_440"/>
    <SBMLMap SBMLid="Kcat8b" COPASIkey="ModelValue_441"/>
    <SBMLMap SBMLid="Kcat9a" COPASIkey="ModelValue_442"/>
    <SBMLMap SBMLid="Km10a" COPASIkey="ModelValue_443"/>
    <SBMLMap SBMLid="Km10b" COPASIkey="ModelValue_444"/>
    <SBMLMap SBMLid="Km11a" COPASIkey="ModelValue_445"/>
    <SBMLMap SBMLid="Km12" COPASIkey="ModelValue_446"/>
    <SBMLMap SBMLid="Km13" COPASIkey="ModelValue_447"/>
    <SBMLMap SBMLid="Km14" COPASIkey="ModelValue_448"/>
    <SBMLMap SBMLid="Km16a" COPASIkey="ModelValue_449"/>
    <SBMLMap SBMLid="Km16b" COPASIkey="ModelValue_450"/>
    <SBMLMap SBMLid="Km17a" COPASIkey="ModelValue_451"/>
    <SBMLMap SBMLid="Km17b" COPASIkey="ModelValue_452"/>
    <SBMLMap SBMLid="Km18b" COPASIkey="ModelValue_453"/>
    <SBMLMap SBMLid="Km19a" COPASIkey="ModelValue_454"/>
    <SBMLMap SBMLid="Km19b" COPASIkey="ModelValue_455"/>
    <SBMLMap SBMLid="Km20" COPASIkey="ModelValue_456"/>
    <SBMLMap SBMLid="Km21" COPASIkey="ModelValue_457"/>
    <SBMLMap SBMLid="Km22a" COPASIkey="ModelValue_458"/>
    <SBMLMap SBMLid="Km22b" COPASIkey="ModelValue_459"/>
    <SBMLMap SBMLid="Km23a" COPASIkey="ModelValue_460"/>
    <SBMLMap SBMLid="Km24" COPASIkey="ModelValue_461"/>
    <SBMLMap SBMLid="Km25" COPASIkey="ModelValue_462"/>
    <SBMLMap SBMLid="Km39" COPASIkey="ModelValue_463"/>
    <SBMLMap SBMLid="Km6b" COPASIkey="ModelValue_464"/>
    <SBMLMap SBMLid="Km7" COPASIkey="ModelValue_465"/>
    <SBMLMap SBMLid="Km8b" COPASIkey="ModelValue_466"/>
    <SBMLMap SBMLid="Km9a" COPASIkey="ModelValue_467"/>
    <SBMLMap SBMLid="Km9b" COPASIkey="ModelValue_468"/>
    <SBMLMap SBMLid="MEK" COPASIkey="Metabolite_238"/>
    <SBMLMap SBMLid="P90Rsk" COPASIkey="Metabolite_239"/>
    <SBMLMap SBMLid="PI3K" COPASIkey="Metabolite_240"/>
    <SBMLMap SBMLid="PIP2" COPASIkey="Metabolite_241"/>
    <SBMLMap SBMLid="PIP3" COPASIkey="Metabolite_242"/>
    <SBMLMap SBMLid="PKCD" COPASIkey="Metabolite_243"/>
    <SBMLMap SBMLid="PP2A" COPASIkey="Metabolite_244"/>
    <SBMLMap SBMLid="PTEN" COPASIkey="Metabolite_245"/>
    <SBMLMap SBMLid="RKIP" COPASIkey="Metabolite_246"/>
    <SBMLMap SBMLid="Raf1" COPASIkey="Metabolite_247"/>
    <SBMLMap SBMLid="RafPPtase" COPASIkey="Metabolite_248"/>
    <SBMLMap SBMLid="Rap1" COPASIkey="Metabolite_249"/>
    <SBMLMap SBMLid="Rap1Gap" COPASIkey="Metabolite_250"/>
    <SBMLMap SBMLid="Ras" COPASIkey="Metabolite_251"/>
    <SBMLMap SBMLid="RasGap" COPASIkey="Metabolite_252"/>
    <SBMLMap SBMLid="SOS" COPASIkey="Metabolite_253"/>
    <SBMLMap SBMLid="TCF" COPASIkey="Metabolite_254"/>
    <SBMLMap SBMLid="TCFBCatenin" COPASIkey="Metabolite_255"/>
    <SBMLMap SBMLid="V1" COPASIkey="ModelValue_469"/>
    <SBMLMap SBMLid="V15b" COPASIkey="ModelValue_470"/>
    <SBMLMap SBMLid="V26a" COPASIkey="ModelValue_471"/>
    <SBMLMap SBMLid="V37b" COPASIkey="ModelValue_472"/>
    <SBMLMap SBMLid="V8a" COPASIkey="ModelValue_473"/>
    <SBMLMap SBMLid="W" COPASIkey="ModelValue_474"/>
    <SBMLMap SBMLid="X" COPASIkey="Metabolite_256"/>
    <SBMLMap SBMLid="bEGFR" COPASIkey="Metabolite_257"/>
    <SBMLMap SBMLid="dEGFR" COPASIkey="Metabolite_258"/>
    <SBMLMap SBMLid="default" COPASIkey="Compartment_4"/>
    <SBMLMap SBMLid="defaultcompartment" COPASIkey="ModelValue_475"/>
    <SBMLMap SBMLid="fEGFR" COPASIkey="Metabolite_259"/>
    <SBMLMap SBMLid="k11b1" COPASIkey="ModelValue_476"/>
    <SBMLMap SBMLid="k11b2" COPASIkey="ModelValue_477"/>
    <SBMLMap SBMLid="k15a" COPASIkey="ModelValue_478"/>
    <SBMLMap SBMLid="k15c" COPASIkey="ModelValue_479"/>
    <SBMLMap SBMLid="k18a" COPASIkey="ModelValue_480"/>
    <SBMLMap SBMLid="k19c" COPASIkey="ModelValue_481"/>
    <SBMLMap SBMLid="k21" COPASIkey="ModelValue_482"/>
    <SBMLMap SBMLid="k22" COPASIkey="ModelValue_483"/>
    <SBMLMap SBMLid="k23b" COPASIkey="ModelValue_484"/>
    <SBMLMap SBMLid="k26a" COPASIkey="ModelValue_485"/>
    <SBMLMap SBMLid="k26b" COPASIkey="ModelValue_486"/>
    <SBMLMap SBMLid="k27c" COPASIkey="ModelValue_487"/>
    <SBMLMap SBMLid="k28" COPASIkey="ModelValue_488"/>
    <SBMLMap SBMLid="k29" COPASIkey="ModelValue_489"/>
    <SBMLMap SBMLid="k3" COPASIkey="ModelValue_490"/>
    <SBMLMap SBMLid="k30" COPASIkey="ModelValue_491"/>
    <SBMLMap SBMLid="k311" COPASIkey="ModelValue_492"/>
    <SBMLMap SBMLid="k312" COPASIkey="ModelValue_493"/>
    <SBMLMap SBMLid="k32a" COPASIkey="ModelValue_494"/>
    <SBMLMap SBMLid="k32b" COPASIkey="ModelValue_495"/>
    <SBMLMap SBMLid="k33a1" COPASIkey="ModelValue_496"/>
    <SBMLMap SBMLid="k33a2" COPASIkey="ModelValue_497"/>
    <SBMLMap SBMLid="k33b" COPASIkey="ModelValue_498"/>
    <SBMLMap SBMLid="k33c1" COPASIkey="ModelValue_499"/>
    <SBMLMap SBMLid="k33c2" COPASIkey="ModelValue_500"/>
    <SBMLMap SBMLid="k341" COPASIkey="ModelValue_501"/>
    <SBMLMap SBMLid="k342" COPASIkey="ModelValue_502"/>
    <SBMLMap SBMLid="k35" COPASIkey="ModelValue_503"/>
    <SBMLMap SBMLid="k36" COPASIkey="ModelValue_504"/>
    <SBMLMap SBMLid="k37a1" COPASIkey="ModelValue_505"/>
    <SBMLMap SBMLid="k37a2" COPASIkey="ModelValue_506"/>
    <SBMLMap SBMLid="k37c" COPASIkey="ModelValue_507"/>
    <SBMLMap SBMLid="k381" COPASIkey="ModelValue_508"/>
    <SBMLMap SBMLid="k382" COPASIkey="ModelValue_509"/>
    <SBMLMap SBMLid="k39" COPASIkey="ModelValue_510"/>
    <SBMLMap SBMLid="k4" COPASIkey="ModelValue_511"/>
    <SBMLMap SBMLid="k40" COPASIkey="ModelValue_512"/>
    <SBMLMap SBMLid="k41" COPASIkey="ModelValue_513"/>
    <SBMLMap SBMLid="k51" COPASIkey="ModelValue_514"/>
    <SBMLMap SBMLid="k52" COPASIkey="ModelValue_515"/>
    <SBMLMap SBMLid="k53" COPASIkey="ModelValue_516"/>
    <SBMLMap SBMLid="k54" COPASIkey="ModelValue_517"/>
    <SBMLMap SBMLid="k6a" COPASIkey="ModelValue_518"/>
    <SBMLMap SBMLid="k9b" COPASIkey="ModelValue_519"/>
    <SBMLMap SBMLid="null" COPASIkey="Metabolite_260"/>
    <SBMLMap SBMLid="pAPCpAxinGSK3B" COPASIkey="Metabolite_261"/>
    <SBMLMap SBMLid="pAPCpAxinGSK3BBCatenin" COPASIkey="Metabolite_262"/>
    <SBMLMap SBMLid="pAPCpAxinGSK3BpBCatenin" COPASIkey="Metabolite_263"/>
    <SBMLMap SBMLid="pAkt" COPASIkey="Metabolite_264"/>
    <SBMLMap SBMLid="pBCatenin" COPASIkey="Metabolite_265"/>
    <SBMLMap SBMLid="pBRaf" COPASIkey="Metabolite_266"/>
    <SBMLMap SBMLid="pC3G" COPASIkey="Metabolite_267"/>
    <SBMLMap SBMLid="pEGFR" COPASIkey="Metabolite_268"/>
    <SBMLMap SBMLid="pERK" COPASIkey="Metabolite_269"/>
    <SBMLMap SBMLid="pGSK3B" COPASIkey="Metabolite_270"/>
    <SBMLMap SBMLid="pMEK" COPASIkey="Metabolite_271"/>
    <SBMLMap SBMLid="pP90Rsk" COPASIkey="Metabolite_272"/>
    <SBMLMap SBMLid="pPI3K" COPASIkey="Metabolite_273"/>
    <SBMLMap SBMLid="pRKIP" COPASIkey="Metabolite_274"/>
    <SBMLMap SBMLid="pRaf1" COPASIkey="Metabolite_275"/>
    <SBMLMap SBMLid="pRap1" COPASIkey="Metabolite_276"/>
    <SBMLMap SBMLid="pRas" COPASIkey="Metabolite_277"/>
    <SBMLMap SBMLid="pSOS" COPASIkey="Metabolite_278"/>
    <SBMLMap SBMLid="v1" COPASIkey="Reaction_252"/>
    <SBMLMap SBMLid="v10a" COPASIkey="Reaction_253"/>
    <SBMLMap SBMLid="v10b" COPASIkey="Reaction_254"/>
    <SBMLMap SBMLid="v11a" COPASIkey="Reaction_255"/>
    <SBMLMap SBMLid="v11b" COPASIkey="Reaction_256"/>
    <SBMLMap SBMLid="v12" COPASIkey="Reaction_257"/>
    <SBMLMap SBMLid="v13" COPASIkey="Reaction_258"/>
    <SBMLMap SBMLid="v14" COPASIkey="Reaction_259"/>
    <SBMLMap SBMLid="v15a" COPASIkey="Reaction_260"/>
    <SBMLMap SBMLid="v15b" COPASIkey="Reaction_261"/>
    <SBMLMap SBMLid="v15c" COPASIkey="Reaction_262"/>
    <SBMLMap SBMLid="v16a" COPASIkey="Reaction_263"/>
    <SBMLMap SBMLid="v16b" COPASIkey="Reaction_264"/>
    <SBMLMap SBMLid="v18a" COPASIkey="Reaction_265"/>
    <SBMLMap SBMLid="v18b" COPASIkey="Reaction_266"/>
    <SBMLMap SBMLid="v19a" COPASIkey="Reaction_267"/>
    <SBMLMap SBMLid="v19b" COPASIkey="Reaction_268"/>
    <SBMLMap SBMLid="v19c" COPASIkey="Reaction_269"/>
    <SBMLMap SBMLid="v2" COPASIkey="Reaction_270"/>
    <SBMLMap SBMLid="v20" COPASIkey="Reaction_271"/>
    <SBMLMap SBMLid="v21" COPASIkey="Reaction_272"/>
    <SBMLMap SBMLid="v22a" COPASIkey="Reaction_273"/>
    <SBMLMap SBMLid="v22b" COPASIkey="Reaction_274"/>
    <SBMLMap SBMLid="v23a" COPASIkey="Reaction_275"/>
    <SBMLMap SBMLid="v23b" COPASIkey="Reaction_276"/>
    <SBMLMap SBMLid="v24" COPASIkey="Reaction_277"/>
    <SBMLMap SBMLid="v25" COPASIkey="Reaction_278"/>
    <SBMLMap SBMLid="v26a" COPASIkey="Reaction_279"/>
    <SBMLMap SBMLid="v26b" COPASIkey="Reaction_280"/>
    <SBMLMap SBMLid="v27a" COPASIkey="Reaction_281"/>
    <SBMLMap SBMLid="v27b" COPASIkey="Reaction_282"/>
    <SBMLMap SBMLid="v27c" COPASIkey="Reaction_283"/>
    <SBMLMap SBMLid="v27d" COPASIkey="Reaction_284"/>
    <SBMLMap SBMLid="v28" COPASIkey="Reaction_285"/>
    <SBMLMap SBMLid="v29" COPASIkey="Reaction_286"/>
    <SBMLMap SBMLid="v3" COPASIkey="Reaction_287"/>
    <SBMLMap SBMLid="v30" COPASIkey="Reaction_288"/>
    <SBMLMap SBMLid="v31" COPASIkey="Reaction_289"/>
    <SBMLMap SBMLid="v32a" COPASIkey="Reaction_290"/>
    <SBMLMap SBMLid="v32b" COPASIkey="Reaction_291"/>
    <SBMLMap SBMLid="v33a" COPASIkey="Reaction_292"/>
    <SBMLMap SBMLid="v33b" COPASIkey="Reaction_293"/>
    <SBMLMap SBMLid="v33c" COPASIkey="Reaction_294"/>
    <SBMLMap SBMLid="v34" COPASIkey="Reaction_295"/>
    <SBMLMap SBMLid="v35" COPASIkey="Reaction_296"/>
    <SBMLMap SBMLid="v36" COPASIkey="Reaction_297"/>
    <SBMLMap SBMLid="v37a" COPASIkey="Reaction_298"/>
    <SBMLMap SBMLid="v37b" COPASIkey="Reaction_299"/>
    <SBMLMap SBMLid="v37c" COPASIkey="Reaction_300"/>
    <SBMLMap SBMLid="v38" COPASIkey="Reaction_301"/>
    <SBMLMap SBMLid="v39" COPASIkey="Reaction_302"/>
    <SBMLMap SBMLid="v4" COPASIkey="Reaction_303"/>
    <SBMLMap SBMLid="v40" COPASIkey="Reaction_304"/>
    <SBMLMap SBMLid="v41" COPASIkey="Reaction_305"/>
    <SBMLMap SBMLid="v5" COPASIkey="Reaction_306"/>
    <SBMLMap SBMLid="v6a" COPASIkey="Reaction_307"/>
    <SBMLMap SBMLid="v6b" COPASIkey="Reaction_308"/>
    <SBMLMap SBMLid="v7" COPASIkey="Reaction_309"/>
    <SBMLMap SBMLid="v8a" COPASIkey="Reaction_310"/>
    <SBMLMap SBMLid="v8b" COPASIkey="Reaction_311"/>
    <SBMLMap SBMLid="v9a" COPASIkey="Reaction_312"/>
    <SBMLMap SBMLid="v9b" COPASIkey="Reaction_313"/>
  </SBMLReference>
  <ListOfUnitDefinitions>
    <UnitDefinition key="Unit_1" name="meter" symbol="m">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_0">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        m
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_5" name="second" symbol="s">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_4">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        s
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_13" name="Avogadro" symbol="Avogadro">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_12">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_17" name="item" symbol="#">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_16">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        #
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_35" name="liter" symbol="l">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_34">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        0.001*m^3
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_41" name="mole" symbol="mol">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_40">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro*#
      </Expression>
    </UnitDefinition>
  </ListOfUnitDefinitions>
</COPASI>
