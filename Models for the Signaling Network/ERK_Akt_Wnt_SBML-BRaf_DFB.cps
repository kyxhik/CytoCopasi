<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.37 (Build 264) (http://www.copasi.org) at 2022-11-24T10:27:33Z -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="37" versionDevel="264" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_14" name="Mass action (reversible)" type="MassAction" reversible="true">
      <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
   <rdf:Description rdf:about="#Function_14">
   <CopasiMT:is rdf:resource="urn:miriam:obo.sbo:SBO:0000042" />
   </rdf:Description>
   </rdf:RDF>
      </MiriamAnnotation>
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
<b>Mass action rate law for reversible reactions</b>
<p>
Reaction scheme where the products are created from the reactants and the change of a product quantity is proportional to the product of reactant activities. The reaction scheme does include a reverse process that creates the reactants from the products.
</p>
</body>
      </Comment>
      <Expression>
        k1*PRODUCT&lt;substrate_i>-k2*PRODUCT&lt;product_j>
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_69" name="k1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_68" name="substrate" order="1" role="substrate"/>
        <ParameterDescription key="FunctionParameter_78" name="k2" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_79" name="product" order="3" role="product"/>
      </ListOfParameterDescriptions>
    </Function>
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
  </ListOfFunctions>
  <Model key="Model_18" name="_1" simulationType="time" timeUnit="s" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="nmol" type="deterministic" avogadroConstant="6.0221417899999999e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Model_18">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2022-11-21T07:48:59Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <ListOfCompartments>
      <Compartment key="Compartment_17" name="default" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_17">
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
      <Metabolite key="Metabolite_997" name="APC" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_997" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_998" name="APCAxin" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_998" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_999" name="APCAxinGSK3B" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_999" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1000" name="APCBCatenin" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1000" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1001" name="Akt" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1001" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1002" name="Axin" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1002" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1003" name="BCatenin" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1003" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1004" name="BRaf" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1004" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1005" name="C3G" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1005" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1006" name="Dsha" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1006" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1007" name="Dshi" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1007" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1008" name="EGF" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1008" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1009" name="ERK" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1009" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1010" name="GSK3B" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1010" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1011" name="MEK" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1011" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1012" name="P90Rsk" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1012" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1013" name="PI3K" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1013" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1014" name="PIP2" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1014" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1015" name="PIP3" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1015" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1016" name="PKCD" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1016" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1017" name="PP2A" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1017" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1018" name="PTEN" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1018" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1019" name="RKIP" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1019" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1020" name="Raf1" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1020" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1021" name="RafPPtase" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1021" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1022" name="Rap1" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1022" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1023" name="Rap1Gap" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1023" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1024" name="Ras" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1024" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1025" name="RasGap" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1025" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1026" name="SOS" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1026" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1027" name="TCF" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1027" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1028" name="TCFBCatenin" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1028" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1029" name="X" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1029" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1030" name="bEGFR" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1030" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1031" name="dEGFR" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1031" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1032" name="fEGFR" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1032" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1033" name="null" simulationType="fixed" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1033" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1034" name="pAPCpAxinGSK3B" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1034" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1035" name="pAPCpAxinGSK3BBCatenin" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1035" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1036" name="pAPCpAxinGSK3BpBCatenin" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1036" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1037" name="pAkt" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1037" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1038" name="pBCatenin" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1038" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1039" name="pBRaf" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1039" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1040" name="pC3G" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1040" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1041" name="pEGFR" simulationType="fixed" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1041" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1042" name="pERK" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1042" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1043" name="pGSK3B" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1043" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1044" name="pMEK" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1044" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1045" name="pP90Rsk" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1045" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1046" name="pPI3K" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1046" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1047" name="pRKIP" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1047" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1048" name="pRaf1" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1048" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1049" name="pRap1" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1049" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1050" name="pRas" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1050" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1051" name="pSOS" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1051" />
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1052" name="DFB" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_1052">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1053" name="pBRafDFB" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_1053">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1054" name="pBRafMekDFB" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_1054">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1055" name="pBRAFpMEKnDFB" simulationType="reactions" compartment="Compartment_17" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_1055">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_1768" name="Kcat10a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1768" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1769" name="Kcat10b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1769" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1770" name="Kcat11a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1770" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1771" name="Kcat12" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1771" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1772" name="Kcat13" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1772" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1773" name="Kcat14" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1773" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1774" name="Kcat16a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1774" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1775" name="Kcat16b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1775" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1776" name="Kcat17a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1776" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1777" name="Kcat17b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1777" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1778" name="Kcat18b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1778" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1779" name="Kcat19a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1779" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1780" name="Kcat19b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1780" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1781" name="Kcat20" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1781" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1782" name="Kcat21" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1782" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1783" name="Kcat22a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1783" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1784" name="Kcat22b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1784" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1785" name="Kcat23a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1785" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1786" name="Kcat24" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1786" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1787" name="Kcat25" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1787" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1788" name="Kcat27a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1788" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1789" name="Kcat27b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1789" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1790" name="Kcat27d" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1790" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1791" name="Kcat6b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1791" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1792" name="Kcat7" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1792" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1793" name="Kcat8b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1793" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1794" name="Kcat9a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1794" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1795" name="Km10a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1795" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1796" name="Km10b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1796" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1797" name="Km11a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1797" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1798" name="Km12" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1798" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1799" name="Km13" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1799" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1800" name="Km14" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1800" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1801" name="Km16a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1801" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1802" name="Km16b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1802" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1803" name="Km17a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1803" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1804" name="Km17b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1804" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1805" name="Km18b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1805" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1806" name="Km19a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1806" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1807" name="Km19b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1807" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1808" name="Km20" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1808" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1809" name="Km21" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1809" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1810" name="Km22a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1810" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1811" name="Km22b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1811" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1812" name="Km23a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1812" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1813" name="Km24" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1813" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1814" name="Km25" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1814" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1815" name="Km39" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1815" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1816" name="Km6b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1816" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1817" name="Km7" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1817" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1818" name="Km8b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1818" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1819" name="Km9a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1819" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1820" name="Km9b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1820" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1821" name="V1" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1821" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1822" name="V15b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1822" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1823" name="V26a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1823" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1824" name="V37b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1824" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1825" name="V8a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1825" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1826" name="W" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1826" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1827" name="defaultcompartment" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1827" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1828" name="k11b1" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1828" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1829" name="k11b2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1829" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1830" name="k15a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1830" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1831" name="k15c" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1831" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1832" name="k18a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1832" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1833" name="k19c" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1833" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1834" name="k21" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1834" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1835" name="k22" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1835" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1836" name="k23b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1836" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1837" name="k26a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1837" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1838" name="k26b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1838" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1839" name="k27c" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1839" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1840" name="k28" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1840" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1841" name="k29" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1841" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1842" name="k3" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1842" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1843" name="k30" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1843" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1844" name="k311" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1844" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1845" name="k312" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1845" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1846" name="k32a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1846" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1847" name="k32b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1847" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1848" name="k33a1" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1848" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1849" name="k33a2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1849" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1850" name="k33b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1850" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1851" name="k33c1" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1851" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1852" name="k33c2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1852" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1853" name="k341" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1853" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1854" name="k342" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1854" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1855" name="k35" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1855" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1856" name="k36" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1856" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1857" name="k37a1" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1857" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1858" name="k37a2" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1858" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1859" name="k37c" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1859" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1860" name="k381" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1860" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1861" name="k382" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1861" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1862" name="k39" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1862" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1863" name="k4" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1863" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1864" name="k40" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1864" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1865" name="k41" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1865" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1866" name="k51" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1866" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1867" name="k52" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1867" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1868" name="k53" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1868" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1869" name="k54" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1869" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1870" name="k6a" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1870" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1871" name="k9b" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1871" />
</rdf:RDF>
        </MiriamAnnotation>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_1121" name="v1" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1121" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1041" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1032" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_11502" name="V1" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_93" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_497">
              <SourceParameter reference="ModelValue_1821"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_496">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1122" name="v10a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1122" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1021" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1048" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1021" stoichiometry="1"/>
          <Product metabolite="Metabolite_1020" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_11501" name="Kcat10a" value="1"/>
          <Constant key="Parameter_11499" name="Km10a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_94" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_494">
              <SourceParameter reference="ModelValue_1768"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_495">
              <SourceParameter reference="ModelValue_1795"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_493">
              <SourceParameter reference="Metabolite_1021"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_492">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_491">
              <SourceParameter reference="Metabolite_1048"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1123" name="v10b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1123" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1037" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1048" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1037" stoichiometry="1"/>
          <Product metabolite="Metabolite_1020" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_11498" name="Kcat10b" value="1"/>
          <Constant key="Parameter_8670" name="Km10b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_95" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_502">
              <SourceParameter reference="ModelValue_1769"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_501">
              <SourceParameter reference="ModelValue_1796"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_500">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_499">
              <SourceParameter reference="Metabolite_1037"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_498">
              <SourceParameter reference="Metabolite_1048"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1124" name="v11a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1124" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1039" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1011" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1039" stoichiometry="1"/>
          <Product metabolite="Metabolite_1044" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8672" name="Kcat11a" value="1"/>
          <Constant key="Parameter_8671" name="Km11a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_96" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_507">
              <SourceParameter reference="ModelValue_1770"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_506">
              <SourceParameter reference="ModelValue_1797"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_505">
              <SourceParameter reference="Metabolite_1011"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_504">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_503">
              <SourceParameter reference="Metabolite_1039"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1125" name="v11b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1125" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1047" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1048" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1011" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1047" stoichiometry="1"/>
          <Product metabolite="Metabolite_1048" stoichiometry="1"/>
          <Product metabolite="Metabolite_1044" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_1019" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_8669" name="k11b1" value="1"/>
          <Constant key="Parameter_8668" name="k11b2" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_92" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_489">
              <SourceParameter reference="Metabolite_1011"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_488">
              <SourceParameter reference="Metabolite_1019"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_487">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_486">
              <SourceParameter reference="ModelValue_1828"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_485">
              <SourceParameter reference="ModelValue_1829"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_484">
              <SourceParameter reference="Metabolite_1047"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_490">
              <SourceParameter reference="Metabolite_1048"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1126" name="v12" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1126" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1044" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1017" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1011" stoichiometry="1"/>
          <Product metabolite="Metabolite_1017" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9188" name="Kcat12" value="1"/>
          <Constant key="Parameter_9190" name="Km12" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_84" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_451">
              <SourceParameter reference="ModelValue_1771"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_450">
              <SourceParameter reference="ModelValue_1798"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_449">
              <SourceParameter reference="Metabolite_1017"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_448">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_447">
              <SourceParameter reference="Metabolite_1044"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1127" name="v13" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1127" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1044" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1009" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1044" stoichiometry="1"/>
          <Product metabolite="Metabolite_1042" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9189" name="Kcat13" value="1"/>
          <Constant key="Parameter_9187" name="Km13" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_85" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_456">
              <SourceParameter reference="Metabolite_1009"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_455">
              <SourceParameter reference="ModelValue_1772"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_454">
              <SourceParameter reference="ModelValue_1799"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_453">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_452">
              <SourceParameter reference="Metabolite_1044"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1128" name="v14" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1128" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1042" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1017" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1009" stoichiometry="1"/>
          <Product metabolite="Metabolite_1017" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9186" name="Kcat14" value="1"/>
          <Constant key="Parameter_9717" name="Km14" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_86" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_461">
              <SourceParameter reference="ModelValue_1773"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_460">
              <SourceParameter reference="ModelValue_1800"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_459">
              <SourceParameter reference="Metabolite_1017"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_458">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_457">
              <SourceParameter reference="Metabolite_1042"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1129" name="v15a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1129" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1042" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1019" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1042" stoichiometry="1"/>
          <Product metabolite="Metabolite_1047" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9719" name="k15a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_87" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_466">
              <SourceParameter reference="Metabolite_1019"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_465">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_464">
              <SourceParameter reference="ModelValue_1830"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_463">
              <SourceParameter reference="Metabolite_1042"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_462">
              <SourceParameter reference="Metabolite_1047"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1130" name="v15b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1130" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1047" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1019" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9718" name="V15b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_88" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_471">
              <SourceParameter reference="ModelValue_1822"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_470">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_469">
              <SourceParameter reference="Metabolite_1047"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1131" name="v15c" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1131" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1019" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1033" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9716" name="k15c" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_89" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_472">
              <SourceParameter reference="Metabolite_1019"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_467">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_468">
              <SourceParameter reference="ModelValue_1831"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1132" name="v16a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1132" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1050" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1004" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1050" stoichiometry="1"/>
          <Product metabolite="Metabolite_1039" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9715" name="Kcat16a" value="1"/>
          <Constant key="Parameter_11330" name="Km16a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_90" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_475">
              <SourceParameter reference="Metabolite_1004"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_474">
              <SourceParameter reference="ModelValue_1774"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_473">
              <SourceParameter reference="ModelValue_1801"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_476">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_477">
              <SourceParameter reference="Metabolite_1050"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1133" name="v16b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1133" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1049" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1004" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1049" stoichiometry="1"/>
          <Product metabolite="Metabolite_1039" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_11332" name="Kcat16b" value="1"/>
          <Constant key="Parameter_11331" name="Km16b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_52" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_322">
              <SourceParameter reference="Metabolite_1004"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_321">
              <SourceParameter reference="ModelValue_1775"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_320">
              <SourceParameter reference="ModelValue_1802"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_319">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_318">
              <SourceParameter reference="Metabolite_1049"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1134" name="v18a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1134" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1045" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1012" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_11329" name="k18a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_53" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_327">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_326">
              <SourceParameter reference="ModelValue_1832"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_325">
              <SourceParameter reference="Metabolite_1045"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1135" name="v18b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1135" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1042" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1012" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1042" stoichiometry="1"/>
          <Product metabolite="Metabolite_1045" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_11328" name="Kcat18b" value="1"/>
          <Constant key="Parameter_9482" name="Km18b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_54" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_328">
              <SourceParameter reference="ModelValue_1778"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_323">
              <SourceParameter reference="ModelValue_1805"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_324">
              <SourceParameter reference="Metabolite_1012"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_329">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_330">
              <SourceParameter reference="Metabolite_1042"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1136" name="v19a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1136" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1030" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1013" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1030" stoichiometry="1"/>
          <Product metabolite="Metabolite_1046" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9484" name="Kcat19a" value="1"/>
          <Constant key="Parameter_9483" name="Km19a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_55" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_335">
              <SourceParameter reference="ModelValue_1779"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_334">
              <SourceParameter reference="ModelValue_1806"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_333">
              <SourceParameter reference="Metabolite_1013"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_332">
              <SourceParameter reference="Metabolite_1030"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_331">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1137" name="v19b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1137" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1013" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1046" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_1050" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_9481" name="Kcat19b" value="1"/>
          <Constant key="Parameter_9480" name="Km19b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_56" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_340">
              <SourceParameter reference="ModelValue_1780"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_339">
              <SourceParameter reference="ModelValue_1807"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_338">
              <SourceParameter reference="Metabolite_1013"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_337">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_336">
              <SourceParameter reference="Metabolite_1050"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1138" name="v19c" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1138" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1046" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1013" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_3934" name="k19c" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_57" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_345">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_344">
              <SourceParameter reference="ModelValue_1833"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_343">
              <SourceParameter reference="Metabolite_1046"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1139" name="v2" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1139" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1032" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1008" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1030" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_3917" name="k21" value="1"/>
          <Constant key="Parameter_11622" name="k22" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_46" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_291">
              <SourceParameter reference="Metabolite_1008"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_290">
              <SourceParameter reference="Metabolite_1030"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="Metabolite_1032"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_292">
              <SourceParameter reference="ModelValue_1834"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_293">
              <SourceParameter reference="ModelValue_1835"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1140" name="v20" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1140" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1046" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1014" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1046" stoichiometry="1"/>
          <Product metabolite="Metabolite_1015" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_3935" name="Kcat20" value="1"/>
          <Constant key="Parameter_1154" name="Km20" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_47" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_299">
              <SourceParameter reference="ModelValue_1781"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_298">
              <SourceParameter reference="ModelValue_1808"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_297">
              <SourceParameter reference="Metabolite_1014"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_296">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_295">
              <SourceParameter reference="Metabolite_1046"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1141" name="v21" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1141" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1018" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1015" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1018" stoichiometry="1"/>
          <Product metabolite="Metabolite_1014" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_3922" name="Kcat21" value="1"/>
          <Constant key="Parameter_3925" name="Km21" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_48" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_303">
              <SourceParameter reference="ModelValue_1782"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_302">
              <SourceParameter reference="ModelValue_1809"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_301">
              <SourceParameter reference="Metabolite_1015"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_300">
              <SourceParameter reference="Metabolite_1018"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_294">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1142" name="v22a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1142" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1015" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1001" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1015" stoichiometry="1"/>
          <Product metabolite="Metabolite_1037" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_3939" name="Kcat22a" value="1"/>
          <Constant key="Parameter_3940" name="Km22a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_49" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_308">
              <SourceParameter reference="Metabolite_1001"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_307">
              <SourceParameter reference="ModelValue_1783"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_306">
              <SourceParameter reference="ModelValue_1810"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_305">
              <SourceParameter reference="Metabolite_1015"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_304">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1143" name="v22b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1143" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1037" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1001" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_3926" name="Kcat22b" value="1"/>
          <Constant key="Parameter_9617" name="Km22b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_50" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_313">
              <SourceParameter reference="ModelValue_1784"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_312">
              <SourceParameter reference="ModelValue_1811"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_311">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_310">
              <SourceParameter reference="Metabolite_1037"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1144" name="v23a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1144" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1030" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1005" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1030" stoichiometry="1"/>
          <Product metabolite="Metabolite_1040" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9619" name="Kcat23a" value="1"/>
          <Constant key="Parameter_9618" name="Km23a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_51" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_316">
              <SourceParameter reference="Metabolite_1005"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_315">
              <SourceParameter reference="ModelValue_1785"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_314">
              <SourceParameter reference="ModelValue_1812"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="Metabolite_1030"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_317">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1145" name="v23b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1145" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1040" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1005" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9616" name="k23b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_39" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_264">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_263">
              <SourceParameter reference="ModelValue_1836"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_262">
              <SourceParameter reference="Metabolite_1040"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1146" name="v24" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1146" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1040" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1022" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1040" stoichiometry="1"/>
          <Product metabolite="Metabolite_1049" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9615" name="Kcat24" value="1"/>
          <Constant key="Parameter_8343" name="Km24" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_40" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_265">
              <SourceParameter reference="ModelValue_1786"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_250">
              <SourceParameter reference="ModelValue_1813"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_261">
              <SourceParameter reference="Metabolite_1022"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_1040"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1147" name="v25" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1147" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1023" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1049" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1023" stoichiometry="1"/>
          <Product metabolite="Metabolite_1022" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8345" name="Kcat25" value="1"/>
          <Constant key="Parameter_8344" name="Km25" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="ModelValue_1787"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="ModelValue_1814"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="Metabolite_1023"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_269">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="Metabolite_1049"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1148" name="v26a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1148" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1010" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1010" stoichiometry="1"/>
          <Product metabolite="Metabolite_1016" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8342" name="V26a" value="1"/>
          <Constant key="Parameter_8341" name="k26a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_42" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_277">
              <SourceParameter reference="Metabolite_1010"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_276">
              <SourceParameter reference="ModelValue_1823"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="ModelValue_1837"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1149" name="v26b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1149" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1016" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1033" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8338" name="k26b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_43" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="Metabolite_1016"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_279">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="ModelValue_1838"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1150" name="v27a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1150" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1042" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1010" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1042" stoichiometry="1"/>
          <Product metabolite="Metabolite_1043" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8340" name="Kcat27a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_44" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="Metabolite_1010"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_281">
              <SourceParameter reference="ModelValue_1788"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="Metabolite_1042"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1151" name="v27b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1151" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1037" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1010" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1037" stoichiometry="1"/>
          <Product metabolite="Metabolite_1043" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8339" name="Kcat27b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_45" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="Metabolite_1010"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="ModelValue_1789"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="Metabolite_1037"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1152" name="v27c" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1152" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1019" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1019" stoichiometry="1"/>
          <Product metabolite="Metabolite_1010" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8337" name="k27c" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_65" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_370">
              <SourceParameter reference="Metabolite_1019"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_371">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_372">
              <SourceParameter reference="ModelValue_1839"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1153" name="v27d" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1153" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1043" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1010" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8336" name="Kcat27d" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_66" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_378">
              <SourceParameter reference="ModelValue_1790"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_377">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_376">
              <SourceParameter reference="Metabolite_1043"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1154" name="v28" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1154" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1007" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1006" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_10437" name="W" value="1"/>
          <Constant key="Parameter_10439" name="k28" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_67" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_381">
              <SourceParameter reference="Metabolite_1007"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_380">
              <SourceParameter reference="ModelValue_1826"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_379">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_382">
              <SourceParameter reference="ModelValue_1840"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1155" name="v29" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1155" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1006" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1007" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_10438" name="k29" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_68" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_386">
              <SourceParameter reference="Metabolite_1006"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_385">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_384">
              <SourceParameter reference="ModelValue_1841"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1156" name="v3" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1156" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1032" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1031" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_10436" name="k3" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_69" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_388">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_387">
              <SourceParameter reference="Metabolite_1032"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_383">
              <SourceParameter reference="ModelValue_1842"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1157" name="v30" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1157" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1006" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_999" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1010" stoichiometry="1"/>
          <Product metabolite="Metabolite_998" stoichiometry="1"/>
          <Product metabolite="Metabolite_1006" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_10435" name="k30" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_70" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_391">
              <SourceParameter reference="Metabolite_999"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_390">
              <SourceParameter reference="Metabolite_1006"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_389">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_392">
              <SourceParameter reference="ModelValue_1843"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1158" name="v31" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1158" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_998" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1010" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_999" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9492" name="k311" value="1"/>
          <Constant key="Parameter_9494" name="k312" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_91" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_482">
              <SourceParameter reference="Metabolite_998"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_481">
              <SourceParameter reference="Metabolite_999"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_480">
              <SourceParameter reference="Metabolite_1010"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_479">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_478">
              <SourceParameter reference="ModelValue_1844"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_483">
              <SourceParameter reference="ModelValue_1845"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1159" name="v32a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1159" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_999" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1034" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9493" name="k32a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_58" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_346">
              <SourceParameter reference="Metabolite_999"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_341">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_342">
              <SourceParameter reference="ModelValue_1846"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1160" name="v32b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1160" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1034" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_999" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9491" name="k32b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_59" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_349">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_348">
              <SourceParameter reference="ModelValue_1847"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_347">
              <SourceParameter reference="Metabolite_1034"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1161" name="v33a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1161" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_997" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1002" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_998" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_9490" name="k33a1" value="1"/>
          <Constant key="Parameter_8415" name="k33a2" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_60" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_352">
              <SourceParameter reference="Metabolite_997"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_351">
              <SourceParameter reference="Metabolite_998"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_350">
              <SourceParameter reference="Metabolite_1002"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_353">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_354">
              <SourceParameter reference="ModelValue_1848"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_355">
              <SourceParameter reference="ModelValue_1849"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1162" name="v33b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1162" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1002" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1033" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8417" name="k33b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_61" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_361">
              <SourceParameter reference="Metabolite_1002"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_360">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_359">
              <SourceParameter reference="ModelValue_1850"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1163" name="v33c" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1163" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1003" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1028" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1003" stoichiometry="1"/>
          <Product metabolite="Metabolite_1028" stoichiometry="1"/>
          <Product metabolite="Metabolite_1002" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8410" name="k33c1" value="1"/>
          <Constant key="Parameter_8414" name="k33c2" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_62" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_356">
              <SourceParameter reference="Metabolite_1003"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_357">
              <SourceParameter reference="Metabolite_1028"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_358">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_362">
              <SourceParameter reference="ModelValue_1851"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_363">
              <SourceParameter reference="ModelValue_1852"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1164" name="v34" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1164" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1003" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1034" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1035" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8416" name="k341" value="1"/>
          <Constant key="Parameter_8413" name="k342" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_63" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_368">
              <SourceParameter reference="Metabolite_1003"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_367">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_366">
              <SourceParameter reference="ModelValue_1853"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_365">
              <SourceParameter reference="ModelValue_1854"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_364">
              <SourceParameter reference="Metabolite_1034"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_369">
              <SourceParameter reference="Metabolite_1035"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1165" name="v35" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1165" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1035" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1036" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8100" name="k35" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_64" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_375">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_374">
              <SourceParameter reference="ModelValue_1855"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_373">
              <SourceParameter reference="Metabolite_1035"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1166" name="v36" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1166" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1036" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1038" stoichiometry="1"/>
          <Product metabolite="Metabolite_1034" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8102" name="k36" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_71" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_396">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_395">
              <SourceParameter reference="ModelValue_1856"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_394">
              <SourceParameter reference="Metabolite_1036"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1167" name="v37a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1167" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1003" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_997" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1000" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8101" name="k37a1" value="1"/>
          <Constant key="Parameter_8099" name="k37a2" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_72" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_398">
              <SourceParameter reference="Metabolite_997"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_397">
              <SourceParameter reference="Metabolite_1000"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_393">
              <SourceParameter reference="Metabolite_1003"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_399">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_400">
              <SourceParameter reference="ModelValue_1857"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_401">
              <SourceParameter reference="ModelValue_1858"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1168" name="v37b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1168" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1033" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1003" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8098" name="V37b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_73" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_407">
              <SourceParameter reference="ModelValue_1824"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_406">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1169" name="v37c" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1169" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1003" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1033" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8110" name="k37c" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_74" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_404">
              <SourceParameter reference="Metabolite_1003"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_405">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_403">
              <SourceParameter reference="ModelValue_1859"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1170" name="v38" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1170" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1027" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1003" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1028" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8112" name="k381" value="1"/>
          <Constant key="Parameter_8111" name="k382" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_75" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_409">
              <SourceParameter reference="Metabolite_1003"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_408">
              <SourceParameter reference="Metabolite_1027"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_402">
              <SourceParameter reference="Metabolite_1028"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_410">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_411">
              <SourceParameter reference="ModelValue_1860"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_412">
              <SourceParameter reference="ModelValue_1861"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1171" name="v39" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1171" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1028" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1029" stoichiometry="1"/>
          <Product metabolite="Metabolite_1028" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8109" name="Km39" value="1"/>
          <Constant key="Parameter_8108" name="k39" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_76" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_418">
              <SourceParameter reference="ModelValue_1815"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_417">
              <SourceParameter reference="Metabolite_1028"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_416">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_415">
              <SourceParameter reference="ModelValue_1862"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1172" name="v4" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1172" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1030" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1031" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8105" name="k4" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_77" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_420">
              <SourceParameter reference="Metabolite_1030"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_419">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_413">
              <SourceParameter reference="ModelValue_1863"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1173" name="v40" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1173" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1029" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1033" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8107" name="k40" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_78" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_422">
              <SourceParameter reference="Metabolite_1029"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_421">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_414">
              <SourceParameter reference="ModelValue_1864"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1174" name="v41" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1174" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1038" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1033" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8106" name="k41" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_79" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_425">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_424">
              <SourceParameter reference="ModelValue_1865"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_423">
              <SourceParameter reference="Metabolite_1038"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1175" name="v5" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1175" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1016" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1042" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1030" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1026" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1016" stoichiometry="1"/>
          <Product metabolite="Metabolite_1042" stoichiometry="1"/>
          <Product metabolite="Metabolite_1030" stoichiometry="1"/>
          <Product metabolite="Metabolite_1051" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8104" name="k51" value="1"/>
          <Constant key="Parameter_8103" name="k52" value="1"/>
          <Constant key="Parameter_8393" name="k53" value="1"/>
          <Constant key="Parameter_8396" name="k54" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_80" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_428">
              <SourceParameter reference="Metabolite_1016"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_427">
              <SourceParameter reference="Metabolite_1030"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_426">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_429">
              <SourceParameter reference="ModelValue_1866"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_430">
              <SourceParameter reference="ModelValue_1867"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_431">
              <SourceParameter reference="ModelValue_1868"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_432">
              <SourceParameter reference="ModelValue_1869"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_433">
              <SourceParameter reference="Metabolite_1042"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1176" name="v6a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1176" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1051" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1026" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8395" name="k6a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_81" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_441">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_440">
              <SourceParameter reference="ModelValue_1870"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_439">
              <SourceParameter reference="Metabolite_1051"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1177" name="v6b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1177" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1045" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1051" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1045" stoichiometry="1"/>
          <Product metabolite="Metabolite_1026" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_8392" name="Kcat6b" value="1"/>
          <Constant key="Parameter_8391" name="Km6b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_82" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_436">
              <SourceParameter reference="ModelValue_1791"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_437">
              <SourceParameter reference="ModelValue_1816"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_438">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_435">
              <SourceParameter reference="Metabolite_1045"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_434">
              <SourceParameter reference="Metabolite_1051"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1178" name="v7" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1178" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1051" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1024" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1051" stoichiometry="1"/>
          <Product metabolite="Metabolite_1050" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7952" name="Kcat7" value="1"/>
          <Constant key="Parameter_7956" name="Km7" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_83" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_446">
              <SourceParameter reference="ModelValue_1792"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_445">
              <SourceParameter reference="ModelValue_1817"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_444">
              <SourceParameter reference="Metabolite_1024"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_443">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_442">
              <SourceParameter reference="Metabolite_1051"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1179" name="v8a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1179" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1033" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1024" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7944" name="V8a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_97" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_512">
              <SourceParameter reference="ModelValue_1825"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_511">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1180" name="v8b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1180" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1025" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1050" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1025" stoichiometry="1"/>
          <Product metabolite="Metabolite_1024" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7951" name="Kcat8b" value="1"/>
          <Constant key="Parameter_7953" name="Km8b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_98" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_509">
              <SourceParameter reference="ModelValue_1793"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_510">
              <SourceParameter reference="ModelValue_1818"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_508">
              <SourceParameter reference="Metabolite_1025"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_513">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_514">
              <SourceParameter reference="Metabolite_1050"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1181" name="v9a" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1181" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1050" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1020" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1050" stoichiometry="1"/>
          <Product metabolite="Metabolite_1048" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7955" name="Kcat9a" value="1"/>
          <Constant key="Parameter_7954" name="Km9a" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_99" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_519">
              <SourceParameter reference="ModelValue_1794"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_518">
              <SourceParameter reference="ModelValue_1819"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_517">
              <SourceParameter reference="Metabolite_1020"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_516">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_515">
              <SourceParameter reference="Metabolite_1050"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1182" name="v9b" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1182" />
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1029" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1020" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1029" stoichiometry="1"/>
          <Product metabolite="Metabolite_1048" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_7945" name="Km9b" value="1"/>
          <Constant key="Parameter_7950" name="W" value="1"/>
          <Constant key="Parameter_11094" name="k9b" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_100" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_524">
              <SourceParameter reference="ModelValue_1820"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_523">
              <SourceParameter reference="Metabolite_1020"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_522">
              <SourceParameter reference="ModelValue_1826"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_521">
              <SourceParameter reference="Metabolite_1029"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_520">
              <SourceParameter reference="Compartment_17"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_525">
              <SourceParameter reference="ModelValue_1871"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1183" name="pBRafActivation" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_1183">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1039" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1052" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1053" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_11096" name="k1" value="106"/>
          <Constant key="Parameter_11095" name="k2" value="5.93e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_14" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_69">
              <SourceParameter reference="Parameter_11096"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_68">
              <SourceParameter reference="Metabolite_1039"/>
              <SourceParameter reference="Metabolite_1052"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_78">
              <SourceParameter reference="Parameter_11095"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_1053"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1184" name="BRafMekDFBComplex" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_1184">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1039" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1011" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1052" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1054" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_11093" name="k1" value="106"/>
          <Constant key="Parameter_11092" name="k2" value="5.93e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_14" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_69">
              <SourceParameter reference="Parameter_11093"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_68">
              <SourceParameter reference="Metabolite_1039"/>
              <SourceParameter reference="Metabolite_1011"/>
              <SourceParameter reference="Metabolite_1052"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_78">
              <SourceParameter reference="Parameter_11092"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_1054"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1185" name="BRafpMekDFBComplex" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_1185">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1039" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1044" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1052" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1055" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_10678" name="k1" value="106"/>
          <Constant key="Parameter_10680" name="k2" value="5.93e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_14" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_69">
              <SourceParameter reference="Parameter_10678"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_68">
              <SourceParameter reference="Metabolite_1039"/>
              <SourceParameter reference="Metabolite_1044"/>
              <SourceParameter reference="Metabolite_1052"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_78">
              <SourceParameter reference="Parameter_10680"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_1055"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1186" name="R3" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_1186">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1053" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1011" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1054" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_10679" name="k1" value="106"/>
          <Constant key="Parameter_10677" name="k2" value="0.02385"/>
        </ListOfConstants>
        <KineticLaw function="Function_14" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_69">
              <SourceParameter reference="Parameter_10679"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_68">
              <SourceParameter reference="Metabolite_1053"/>
              <SourceParameter reference="Metabolite_1011"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_78">
              <SourceParameter reference="Parameter_10677"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_1054"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1187" name="R5" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Reaction_1187">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_1053" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_1044" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1055" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_10676" name="k1" value="106"/>
          <Constant key="Parameter_11079" name="k2" value="0.02385"/>
        </ListOfConstants>
        <KineticLaw function="Function_14" unitType="Default" scalingCompartment="CN=Root,Model=_1,Vector=Compartments[default]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_69">
              <SourceParameter reference="Parameter_10676"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_68">
              <SourceParameter reference="Metabolite_1053"/>
              <SourceParameter reference="Metabolite_1044"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_78">
              <SourceParameter reference="Parameter_11079"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_1055"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_18">
      <ModelParameterSet key="ModelParameterSet_18" name="Initial State">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelParameterSet_18">
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
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[RKIP]" value="12591696268711000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Raf1]" value="60221417900000000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[RafPPtase]" value="36132850740000000" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Rap1]" value="1.204428358e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[Rap1Gap]" value="7226570148000001" type="Species" simulationType="reactions"/>
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
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pGSK3B]" value="515158097283760" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pMEK]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pP90Rsk]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pPI3K]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pRKIP]" value="519048400880100" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pRaf1]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pRap1]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pRas]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pSOS]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[DFB]" value="6.02214179e+17" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pBRafDFB]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pBRafMekDFB]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=_1,Vector=Compartments[default],Vector=Metabolites[pBRAFpMEKnDFB]" value="0" type="Species" simulationType="reactions"/>
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
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[pBRafActivation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=_1,Vector=Reactions[pBRafActivation],ParameterGroup=Parameters,Parameter=k1" value="106" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=_1,Vector=Reactions[pBRafActivation],ParameterGroup=Parameters,Parameter=k2" value="5.9299999999999998e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[BRafMekDFBComplex]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=_1,Vector=Reactions[BRafMekDFBComplex],ParameterGroup=Parameters,Parameter=k1" value="106" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=_1,Vector=Reactions[BRafMekDFBComplex],ParameterGroup=Parameters,Parameter=k2" value="5.9299999999999998e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[BRafpMekDFBComplex]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=_1,Vector=Reactions[BRafpMekDFBComplex],ParameterGroup=Parameters,Parameter=k1" value="106" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=_1,Vector=Reactions[BRafpMekDFBComplex],ParameterGroup=Parameters,Parameter=k2" value="5.9299999999999998e-05" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[R3]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=_1,Vector=Reactions[R3],ParameterGroup=Parameters,Parameter=k1" value="106" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=_1,Vector=Reactions[R3],ParameterGroup=Parameters,Parameter=k2" value="0.02385" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=_1,Vector=Reactions[R5]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=_1,Vector=Reactions[R5],ParameterGroup=Parameters,Parameter=k1" value="106" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=_1,Vector=Reactions[R5],ParameterGroup=Parameters,Parameter=k2" value="0.02385" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_18"/>
      <StateTemplateVariable objectReference="Metabolite_1010"/>
      <StateTemplateVariable objectReference="Metabolite_1003"/>
      <StateTemplateVariable objectReference="Metabolite_1011"/>
      <StateTemplateVariable objectReference="Metabolite_1039"/>
      <StateTemplateVariable objectReference="Metabolite_1020"/>
      <StateTemplateVariable objectReference="Metabolite_1034"/>
      <StateTemplateVariable objectReference="Metabolite_1013"/>
      <StateTemplateVariable objectReference="Metabolite_1019"/>
      <StateTemplateVariable objectReference="Metabolite_1024"/>
      <StateTemplateVariable objectReference="Metabolite_1026"/>
      <StateTemplateVariable objectReference="Metabolite_1032"/>
      <StateTemplateVariable objectReference="Metabolite_1002"/>
      <StateTemplateVariable objectReference="Metabolite_1044"/>
      <StateTemplateVariable objectReference="Metabolite_999"/>
      <StateTemplateVariable objectReference="Metabolite_1012"/>
      <StateTemplateVariable objectReference="Metabolite_1014"/>
      <StateTemplateVariable objectReference="Metabolite_1016"/>
      <StateTemplateVariable objectReference="Metabolite_1001"/>
      <StateTemplateVariable objectReference="Metabolite_1022"/>
      <StateTemplateVariable objectReference="Metabolite_1005"/>
      <StateTemplateVariable objectReference="Metabolite_1006"/>
      <StateTemplateVariable objectReference="Metabolite_1029"/>
      <StateTemplateVariable objectReference="Metabolite_1042"/>
      <StateTemplateVariable objectReference="Metabolite_1030"/>
      <StateTemplateVariable objectReference="Metabolite_1036"/>
      <StateTemplateVariable objectReference="Metabolite_997"/>
      <StateTemplateVariable objectReference="Metabolite_1038"/>
      <StateTemplateVariable objectReference="Metabolite_1043"/>
      <StateTemplateVariable objectReference="Metabolite_1053"/>
      <StateTemplateVariable objectReference="Metabolite_1055"/>
      <StateTemplateVariable objectReference="Metabolite_1028"/>
      <StateTemplateVariable objectReference="Metabolite_1047"/>
      <StateTemplateVariable objectReference="Metabolite_1050"/>
      <StateTemplateVariable objectReference="Metabolite_998"/>
      <StateTemplateVariable objectReference="Metabolite_1031"/>
      <StateTemplateVariable objectReference="Metabolite_1008"/>
      <StateTemplateVariable objectReference="Metabolite_1035"/>
      <StateTemplateVariable objectReference="Metabolite_1000"/>
      <StateTemplateVariable objectReference="Metabolite_1052"/>
      <StateTemplateVariable objectReference="Metabolite_1051"/>
      <StateTemplateVariable objectReference="Metabolite_1046"/>
      <StateTemplateVariable objectReference="Metabolite_1054"/>
      <StateTemplateVariable objectReference="Metabolite_1007"/>
      <StateTemplateVariable objectReference="Metabolite_1009"/>
      <StateTemplateVariable objectReference="Metabolite_1040"/>
      <StateTemplateVariable objectReference="Metabolite_1037"/>
      <StateTemplateVariable objectReference="Metabolite_1045"/>
      <StateTemplateVariable objectReference="Metabolite_1048"/>
      <StateTemplateVariable objectReference="Metabolite_1004"/>
      <StateTemplateVariable objectReference="Metabolite_1027"/>
      <StateTemplateVariable objectReference="Metabolite_1015"/>
      <StateTemplateVariable objectReference="Metabolite_1049"/>
      <StateTemplateVariable objectReference="Metabolite_1033"/>
      <StateTemplateVariable objectReference="Metabolite_1041"/>
      <StateTemplateVariable objectReference="Metabolite_1017"/>
      <StateTemplateVariable objectReference="Metabolite_1018"/>
      <StateTemplateVariable objectReference="Metabolite_1021"/>
      <StateTemplateVariable objectReference="Metabolite_1023"/>
      <StateTemplateVariable objectReference="Metabolite_1025"/>
      <StateTemplateVariable objectReference="Compartment_17"/>
      <StateTemplateVariable objectReference="ModelValue_1768"/>
      <StateTemplateVariable objectReference="ModelValue_1769"/>
      <StateTemplateVariable objectReference="ModelValue_1770"/>
      <StateTemplateVariable objectReference="ModelValue_1771"/>
      <StateTemplateVariable objectReference="ModelValue_1772"/>
      <StateTemplateVariable objectReference="ModelValue_1773"/>
      <StateTemplateVariable objectReference="ModelValue_1774"/>
      <StateTemplateVariable objectReference="ModelValue_1775"/>
      <StateTemplateVariable objectReference="ModelValue_1776"/>
      <StateTemplateVariable objectReference="ModelValue_1777"/>
      <StateTemplateVariable objectReference="ModelValue_1778"/>
      <StateTemplateVariable objectReference="ModelValue_1779"/>
      <StateTemplateVariable objectReference="ModelValue_1780"/>
      <StateTemplateVariable objectReference="ModelValue_1781"/>
      <StateTemplateVariable objectReference="ModelValue_1782"/>
      <StateTemplateVariable objectReference="ModelValue_1783"/>
      <StateTemplateVariable objectReference="ModelValue_1784"/>
      <StateTemplateVariable objectReference="ModelValue_1785"/>
      <StateTemplateVariable objectReference="ModelValue_1786"/>
      <StateTemplateVariable objectReference="ModelValue_1787"/>
      <StateTemplateVariable objectReference="ModelValue_1788"/>
      <StateTemplateVariable objectReference="ModelValue_1789"/>
      <StateTemplateVariable objectReference="ModelValue_1790"/>
      <StateTemplateVariable objectReference="ModelValue_1791"/>
      <StateTemplateVariable objectReference="ModelValue_1792"/>
      <StateTemplateVariable objectReference="ModelValue_1793"/>
      <StateTemplateVariable objectReference="ModelValue_1794"/>
      <StateTemplateVariable objectReference="ModelValue_1795"/>
      <StateTemplateVariable objectReference="ModelValue_1796"/>
      <StateTemplateVariable objectReference="ModelValue_1797"/>
      <StateTemplateVariable objectReference="ModelValue_1798"/>
      <StateTemplateVariable objectReference="ModelValue_1799"/>
      <StateTemplateVariable objectReference="ModelValue_1800"/>
      <StateTemplateVariable objectReference="ModelValue_1801"/>
      <StateTemplateVariable objectReference="ModelValue_1802"/>
      <StateTemplateVariable objectReference="ModelValue_1803"/>
      <StateTemplateVariable objectReference="ModelValue_1804"/>
      <StateTemplateVariable objectReference="ModelValue_1805"/>
      <StateTemplateVariable objectReference="ModelValue_1806"/>
      <StateTemplateVariable objectReference="ModelValue_1807"/>
      <StateTemplateVariable objectReference="ModelValue_1808"/>
      <StateTemplateVariable objectReference="ModelValue_1809"/>
      <StateTemplateVariable objectReference="ModelValue_1810"/>
      <StateTemplateVariable objectReference="ModelValue_1811"/>
      <StateTemplateVariable objectReference="ModelValue_1812"/>
      <StateTemplateVariable objectReference="ModelValue_1813"/>
      <StateTemplateVariable objectReference="ModelValue_1814"/>
      <StateTemplateVariable objectReference="ModelValue_1815"/>
      <StateTemplateVariable objectReference="ModelValue_1816"/>
      <StateTemplateVariable objectReference="ModelValue_1817"/>
      <StateTemplateVariable objectReference="ModelValue_1818"/>
      <StateTemplateVariable objectReference="ModelValue_1819"/>
      <StateTemplateVariable objectReference="ModelValue_1820"/>
      <StateTemplateVariable objectReference="ModelValue_1821"/>
      <StateTemplateVariable objectReference="ModelValue_1822"/>
      <StateTemplateVariable objectReference="ModelValue_1823"/>
      <StateTemplateVariable objectReference="ModelValue_1824"/>
      <StateTemplateVariable objectReference="ModelValue_1825"/>
      <StateTemplateVariable objectReference="ModelValue_1826"/>
      <StateTemplateVariable objectReference="ModelValue_1827"/>
      <StateTemplateVariable objectReference="ModelValue_1828"/>
      <StateTemplateVariable objectReference="ModelValue_1829"/>
      <StateTemplateVariable objectReference="ModelValue_1830"/>
      <StateTemplateVariable objectReference="ModelValue_1831"/>
      <StateTemplateVariable objectReference="ModelValue_1832"/>
      <StateTemplateVariable objectReference="ModelValue_1833"/>
      <StateTemplateVariable objectReference="ModelValue_1834"/>
      <StateTemplateVariable objectReference="ModelValue_1835"/>
      <StateTemplateVariable objectReference="ModelValue_1836"/>
      <StateTemplateVariable objectReference="ModelValue_1837"/>
      <StateTemplateVariable objectReference="ModelValue_1838"/>
      <StateTemplateVariable objectReference="ModelValue_1839"/>
      <StateTemplateVariable objectReference="ModelValue_1840"/>
      <StateTemplateVariable objectReference="ModelValue_1841"/>
      <StateTemplateVariable objectReference="ModelValue_1842"/>
      <StateTemplateVariable objectReference="ModelValue_1843"/>
      <StateTemplateVariable objectReference="ModelValue_1844"/>
      <StateTemplateVariable objectReference="ModelValue_1845"/>
      <StateTemplateVariable objectReference="ModelValue_1846"/>
      <StateTemplateVariable objectReference="ModelValue_1847"/>
      <StateTemplateVariable objectReference="ModelValue_1848"/>
      <StateTemplateVariable objectReference="ModelValue_1849"/>
      <StateTemplateVariable objectReference="ModelValue_1850"/>
      <StateTemplateVariable objectReference="ModelValue_1851"/>
      <StateTemplateVariable objectReference="ModelValue_1852"/>
      <StateTemplateVariable objectReference="ModelValue_1853"/>
      <StateTemplateVariable objectReference="ModelValue_1854"/>
      <StateTemplateVariable objectReference="ModelValue_1855"/>
      <StateTemplateVariable objectReference="ModelValue_1856"/>
      <StateTemplateVariable objectReference="ModelValue_1857"/>
      <StateTemplateVariable objectReference="ModelValue_1858"/>
      <StateTemplateVariable objectReference="ModelValue_1859"/>
      <StateTemplateVariable objectReference="ModelValue_1860"/>
      <StateTemplateVariable objectReference="ModelValue_1861"/>
      <StateTemplateVariable objectReference="ModelValue_1862"/>
      <StateTemplateVariable objectReference="ModelValue_1863"/>
      <StateTemplateVariable objectReference="ModelValue_1864"/>
      <StateTemplateVariable objectReference="ModelValue_1865"/>
      <StateTemplateVariable objectReference="ModelValue_1866"/>
      <StateTemplateVariable objectReference="ModelValue_1867"/>
      <StateTemplateVariable objectReference="ModelValue_1868"/>
      <StateTemplateVariable objectReference="ModelValue_1869"/>
      <StateTemplateVariable objectReference="ModelValue_1870"/>
      <StateTemplateVariable objectReference="ModelValue_1871"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 29590998113523000 25727794155238000 4.0950564172e+17 0 60221417900000000 9213876938700 60221417900000000 12591696268711000 60221417900000000 60221417900000000 1.806642537e+17 481771343200 0 4576827760400 36132850740000000 4.215499253e+17 0 1.204428358e+17 1.204428358e+17 3.011070895e+17 0 6180524119077000 0 0 1204428358000 58175094119758000 595047830269900 515158097283760 0 0 5306771566765899 519048400880100 0 903321268500 0 3.613285074e+17 1204428358000 2071135004416800 6.02214179e+17 0 0 0 60221417900000000 1.5657568654e+17 0 0 0 0 1.204428358e+17 3726441118234100 0 0 0 30110708950000 1.4453140296e+17 1.6259782833e+17 36132850740000000 7226570148000001 60221417900000000 1 0.12633 15.1212 185.75999999999999 2.8323999999999998 9.8536999999999999 8.8911999999999995 0.8841 0.8841 0.12633 15.1212 0.02137 10.6737 0.077109999999999998 4 5.5 0.33000000000000002 48.667000000000002 694.73000000000002 32.344000000000001 1509.4000000000001 0.002 0.045960000000000001 0.01541 1611.97 32.643999999999998 1509.3599999999999 0.88409599999999999 1061.7 119355 4768400 518750 1007300 3496500 62645 62464.599999999999 1061.71 119355 763523 184912 272056 4 0.080000000000000002 100 100 6086100 35954.300000000003 1432400 15 896896 35954.300000000003 1432410 62464.599999999999 15 100 4 0.0015399999999999999 0.0070499999999999998 0.0717 0 1 1.1167e-05 120 1.3 0.0019300000000000001 0.0050000000000000001 0.0050000000000000001 2.18503e-05 0.121008 2.5 20 0.00038499999999999998 0.00014999999999999999 0.0030000000000000001 0.0030000000000000001 0.00125 0.00083299999999999997 0.0015150000000000001 0.01515 0.00445 0.0022169999999999998 0.016670000000000001 0.83330000000000004 0.0027829999999999999 1.37e-06 1.667e-08 0.016670000000000001 2 3.4329999999999998 3.4329999999999998 0.016670000000000001 20 4.2830000000000003e-06 0.016670000000000001 0.5 0.01 0.20000000000000001 0.00025000000000000001 0.0069499999999999996 0.0034650000000000002 3.8500000000000001e-05 0.00028833 1.5 2.5 0.025000000000000001 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_252" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_198" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_253" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Report reference="Report_199" target="" append="1" confirmOverwrite="1"/>
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
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_254" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
        </ParameterGroup>
        <Parameter name="Output in subtask" type="bool" value="1"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
        <Parameter name="Continue on Error" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_255" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_200" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_256" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_201" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_257" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_202" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_258" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_203" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_252"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Use Reder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_259" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_204" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_260" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_205" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_261" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_206" target="" append="1" confirmOverwrite="1"/>
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
    <Task key="Task_262" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Report reference="Report_207" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_263" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
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
    <Task key="Task_264" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_208" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_252"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
    <Task key="Task_265" name="Time-Course Sensitivities" type="timeSensitivities" scheduled="false" updateModel="false">
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
    <Report key="Report_198" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_199" name="Time-Course" taskType="timeCourse" separator="&#x09;" precision="6">
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
    <Report key="Report_200" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_201" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
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
    <Report key="Report_202" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
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
    <Report key="Report_203" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
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
    <Report key="Report_204" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
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
    <Report key="Report_205" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
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
    <Report key="Report_206" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
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
    <Report key="Report_207" name="Moieties" taskType="moieties" separator="&#x09;" precision="6">
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
    <Report key="Report_208" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
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
    <SBMLMap SBMLid="APC" COPASIkey="Metabolite_997"/>
    <SBMLMap SBMLid="APCAxin" COPASIkey="Metabolite_998"/>
    <SBMLMap SBMLid="APCAxinGSK3B" COPASIkey="Metabolite_999"/>
    <SBMLMap SBMLid="APCBCatenin" COPASIkey="Metabolite_1000"/>
    <SBMLMap SBMLid="Akt" COPASIkey="Metabolite_1001"/>
    <SBMLMap SBMLid="Axin" COPASIkey="Metabolite_1002"/>
    <SBMLMap SBMLid="BCatenin" COPASIkey="Metabolite_1003"/>
    <SBMLMap SBMLid="BRaf" COPASIkey="Metabolite_1004"/>
    <SBMLMap SBMLid="C3G" COPASIkey="Metabolite_1005"/>
    <SBMLMap SBMLid="Dsha" COPASIkey="Metabolite_1006"/>
    <SBMLMap SBMLid="Dshi" COPASIkey="Metabolite_1007"/>
    <SBMLMap SBMLid="EGF" COPASIkey="Metabolite_1008"/>
    <SBMLMap SBMLid="ERK" COPASIkey="Metabolite_1009"/>
    <SBMLMap SBMLid="GSK3B" COPASIkey="Metabolite_1010"/>
    <SBMLMap SBMLid="Kcat10a" COPASIkey="ModelValue_1768"/>
    <SBMLMap SBMLid="Kcat10b" COPASIkey="ModelValue_1769"/>
    <SBMLMap SBMLid="Kcat11a" COPASIkey="ModelValue_1770"/>
    <SBMLMap SBMLid="Kcat12" COPASIkey="ModelValue_1771"/>
    <SBMLMap SBMLid="Kcat13" COPASIkey="ModelValue_1772"/>
    <SBMLMap SBMLid="Kcat14" COPASIkey="ModelValue_1773"/>
    <SBMLMap SBMLid="Kcat16a" COPASIkey="ModelValue_1774"/>
    <SBMLMap SBMLid="Kcat16b" COPASIkey="ModelValue_1775"/>
    <SBMLMap SBMLid="Kcat17a" COPASIkey="ModelValue_1776"/>
    <SBMLMap SBMLid="Kcat17b" COPASIkey="ModelValue_1777"/>
    <SBMLMap SBMLid="Kcat18b" COPASIkey="ModelValue_1778"/>
    <SBMLMap SBMLid="Kcat19a" COPASIkey="ModelValue_1779"/>
    <SBMLMap SBMLid="Kcat19b" COPASIkey="ModelValue_1780"/>
    <SBMLMap SBMLid="Kcat20" COPASIkey="ModelValue_1781"/>
    <SBMLMap SBMLid="Kcat21" COPASIkey="ModelValue_1782"/>
    <SBMLMap SBMLid="Kcat22a" COPASIkey="ModelValue_1783"/>
    <SBMLMap SBMLid="Kcat22b" COPASIkey="ModelValue_1784"/>
    <SBMLMap SBMLid="Kcat23a" COPASIkey="ModelValue_1785"/>
    <SBMLMap SBMLid="Kcat24" COPASIkey="ModelValue_1786"/>
    <SBMLMap SBMLid="Kcat25" COPASIkey="ModelValue_1787"/>
    <SBMLMap SBMLid="Kcat27a" COPASIkey="ModelValue_1788"/>
    <SBMLMap SBMLid="Kcat27b" COPASIkey="ModelValue_1789"/>
    <SBMLMap SBMLid="Kcat27d" COPASIkey="ModelValue_1790"/>
    <SBMLMap SBMLid="Kcat6b" COPASIkey="ModelValue_1791"/>
    <SBMLMap SBMLid="Kcat7" COPASIkey="ModelValue_1792"/>
    <SBMLMap SBMLid="Kcat8b" COPASIkey="ModelValue_1793"/>
    <SBMLMap SBMLid="Kcat9a" COPASIkey="ModelValue_1794"/>
    <SBMLMap SBMLid="Km10a" COPASIkey="ModelValue_1795"/>
    <SBMLMap SBMLid="Km10b" COPASIkey="ModelValue_1796"/>
    <SBMLMap SBMLid="Km11a" COPASIkey="ModelValue_1797"/>
    <SBMLMap SBMLid="Km12" COPASIkey="ModelValue_1798"/>
    <SBMLMap SBMLid="Km13" COPASIkey="ModelValue_1799"/>
    <SBMLMap SBMLid="Km14" COPASIkey="ModelValue_1800"/>
    <SBMLMap SBMLid="Km16a" COPASIkey="ModelValue_1801"/>
    <SBMLMap SBMLid="Km16b" COPASIkey="ModelValue_1802"/>
    <SBMLMap SBMLid="Km17a" COPASIkey="ModelValue_1803"/>
    <SBMLMap SBMLid="Km17b" COPASIkey="ModelValue_1804"/>
    <SBMLMap SBMLid="Km18b" COPASIkey="ModelValue_1805"/>
    <SBMLMap SBMLid="Km19a" COPASIkey="ModelValue_1806"/>
    <SBMLMap SBMLid="Km19b" COPASIkey="ModelValue_1807"/>
    <SBMLMap SBMLid="Km20" COPASIkey="ModelValue_1808"/>
    <SBMLMap SBMLid="Km21" COPASIkey="ModelValue_1809"/>
    <SBMLMap SBMLid="Km22a" COPASIkey="ModelValue_1810"/>
    <SBMLMap SBMLid="Km22b" COPASIkey="ModelValue_1811"/>
    <SBMLMap SBMLid="Km23a" COPASIkey="ModelValue_1812"/>
    <SBMLMap SBMLid="Km24" COPASIkey="ModelValue_1813"/>
    <SBMLMap SBMLid="Km25" COPASIkey="ModelValue_1814"/>
    <SBMLMap SBMLid="Km39" COPASIkey="ModelValue_1815"/>
    <SBMLMap SBMLid="Km6b" COPASIkey="ModelValue_1816"/>
    <SBMLMap SBMLid="Km7" COPASIkey="ModelValue_1817"/>
    <SBMLMap SBMLid="Km8b" COPASIkey="ModelValue_1818"/>
    <SBMLMap SBMLid="Km9a" COPASIkey="ModelValue_1819"/>
    <SBMLMap SBMLid="Km9b" COPASIkey="ModelValue_1820"/>
    <SBMLMap SBMLid="MEK" COPASIkey="Metabolite_1011"/>
    <SBMLMap SBMLid="P90Rsk" COPASIkey="Metabolite_1012"/>
    <SBMLMap SBMLid="PI3K" COPASIkey="Metabolite_1013"/>
    <SBMLMap SBMLid="PIP2" COPASIkey="Metabolite_1014"/>
    <SBMLMap SBMLid="PIP3" COPASIkey="Metabolite_1015"/>
    <SBMLMap SBMLid="PKCD" COPASIkey="Metabolite_1016"/>
    <SBMLMap SBMLid="PP2A" COPASIkey="Metabolite_1017"/>
    <SBMLMap SBMLid="PTEN" COPASIkey="Metabolite_1018"/>
    <SBMLMap SBMLid="RKIP" COPASIkey="Metabolite_1019"/>
    <SBMLMap SBMLid="Raf1" COPASIkey="Metabolite_1020"/>
    <SBMLMap SBMLid="RafPPtase" COPASIkey="Metabolite_1021"/>
    <SBMLMap SBMLid="Rap1" COPASIkey="Metabolite_1022"/>
    <SBMLMap SBMLid="Rap1Gap" COPASIkey="Metabolite_1023"/>
    <SBMLMap SBMLid="Ras" COPASIkey="Metabolite_1024"/>
    <SBMLMap SBMLid="RasGap" COPASIkey="Metabolite_1025"/>
    <SBMLMap SBMLid="SOS" COPASIkey="Metabolite_1026"/>
    <SBMLMap SBMLid="TCF" COPASIkey="Metabolite_1027"/>
    <SBMLMap SBMLid="TCFBCatenin" COPASIkey="Metabolite_1028"/>
    <SBMLMap SBMLid="V1" COPASIkey="ModelValue_1821"/>
    <SBMLMap SBMLid="V15b" COPASIkey="ModelValue_1822"/>
    <SBMLMap SBMLid="V26a" COPASIkey="ModelValue_1823"/>
    <SBMLMap SBMLid="V37b" COPASIkey="ModelValue_1824"/>
    <SBMLMap SBMLid="V8a" COPASIkey="ModelValue_1825"/>
    <SBMLMap SBMLid="W" COPASIkey="ModelValue_1826"/>
    <SBMLMap SBMLid="X" COPASIkey="Metabolite_1029"/>
    <SBMLMap SBMLid="bEGFR" COPASIkey="Metabolite_1030"/>
    <SBMLMap SBMLid="dEGFR" COPASIkey="Metabolite_1031"/>
    <SBMLMap SBMLid="default" COPASIkey="Compartment_17"/>
    <SBMLMap SBMLid="defaultcompartment" COPASIkey="ModelValue_1827"/>
    <SBMLMap SBMLid="fEGFR" COPASIkey="Metabolite_1032"/>
    <SBMLMap SBMLid="k11b1" COPASIkey="ModelValue_1828"/>
    <SBMLMap SBMLid="k11b2" COPASIkey="ModelValue_1829"/>
    <SBMLMap SBMLid="k15a" COPASIkey="ModelValue_1830"/>
    <SBMLMap SBMLid="k15c" COPASIkey="ModelValue_1831"/>
    <SBMLMap SBMLid="k18a" COPASIkey="ModelValue_1832"/>
    <SBMLMap SBMLid="k19c" COPASIkey="ModelValue_1833"/>
    <SBMLMap SBMLid="k21" COPASIkey="ModelValue_1834"/>
    <SBMLMap SBMLid="k22" COPASIkey="ModelValue_1835"/>
    <SBMLMap SBMLid="k23b" COPASIkey="ModelValue_1836"/>
    <SBMLMap SBMLid="k26a" COPASIkey="ModelValue_1837"/>
    <SBMLMap SBMLid="k26b" COPASIkey="ModelValue_1838"/>
    <SBMLMap SBMLid="k27c" COPASIkey="ModelValue_1839"/>
    <SBMLMap SBMLid="k28" COPASIkey="ModelValue_1840"/>
    <SBMLMap SBMLid="k29" COPASIkey="ModelValue_1841"/>
    <SBMLMap SBMLid="k3" COPASIkey="ModelValue_1842"/>
    <SBMLMap SBMLid="k30" COPASIkey="ModelValue_1843"/>
    <SBMLMap SBMLid="k311" COPASIkey="ModelValue_1844"/>
    <SBMLMap SBMLid="k312" COPASIkey="ModelValue_1845"/>
    <SBMLMap SBMLid="k32a" COPASIkey="ModelValue_1846"/>
    <SBMLMap SBMLid="k32b" COPASIkey="ModelValue_1847"/>
    <SBMLMap SBMLid="k33a1" COPASIkey="ModelValue_1848"/>
    <SBMLMap SBMLid="k33a2" COPASIkey="ModelValue_1849"/>
    <SBMLMap SBMLid="k33b" COPASIkey="ModelValue_1850"/>
    <SBMLMap SBMLid="k33c1" COPASIkey="ModelValue_1851"/>
    <SBMLMap SBMLid="k33c2" COPASIkey="ModelValue_1852"/>
    <SBMLMap SBMLid="k341" COPASIkey="ModelValue_1853"/>
    <SBMLMap SBMLid="k342" COPASIkey="ModelValue_1854"/>
    <SBMLMap SBMLid="k35" COPASIkey="ModelValue_1855"/>
    <SBMLMap SBMLid="k36" COPASIkey="ModelValue_1856"/>
    <SBMLMap SBMLid="k37a1" COPASIkey="ModelValue_1857"/>
    <SBMLMap SBMLid="k37a2" COPASIkey="ModelValue_1858"/>
    <SBMLMap SBMLid="k37c" COPASIkey="ModelValue_1859"/>
    <SBMLMap SBMLid="k381" COPASIkey="ModelValue_1860"/>
    <SBMLMap SBMLid="k382" COPASIkey="ModelValue_1861"/>
    <SBMLMap SBMLid="k39" COPASIkey="ModelValue_1862"/>
    <SBMLMap SBMLid="k4" COPASIkey="ModelValue_1863"/>
    <SBMLMap SBMLid="k40" COPASIkey="ModelValue_1864"/>
    <SBMLMap SBMLid="k41" COPASIkey="ModelValue_1865"/>
    <SBMLMap SBMLid="k51" COPASIkey="ModelValue_1866"/>
    <SBMLMap SBMLid="k52" COPASIkey="ModelValue_1867"/>
    <SBMLMap SBMLid="k53" COPASIkey="ModelValue_1868"/>
    <SBMLMap SBMLid="k54" COPASIkey="ModelValue_1869"/>
    <SBMLMap SBMLid="k6a" COPASIkey="ModelValue_1870"/>
    <SBMLMap SBMLid="k9b" COPASIkey="ModelValue_1871"/>
    <SBMLMap SBMLid="null" COPASIkey="Metabolite_1033"/>
    <SBMLMap SBMLid="pAPCpAxinGSK3B" COPASIkey="Metabolite_1034"/>
    <SBMLMap SBMLid="pAPCpAxinGSK3BBCatenin" COPASIkey="Metabolite_1035"/>
    <SBMLMap SBMLid="pAPCpAxinGSK3BpBCatenin" COPASIkey="Metabolite_1036"/>
    <SBMLMap SBMLid="pAkt" COPASIkey="Metabolite_1037"/>
    <SBMLMap SBMLid="pBCatenin" COPASIkey="Metabolite_1038"/>
    <SBMLMap SBMLid="pBRaf" COPASIkey="Metabolite_1039"/>
    <SBMLMap SBMLid="pC3G" COPASIkey="Metabolite_1040"/>
    <SBMLMap SBMLid="pEGFR" COPASIkey="Metabolite_1041"/>
    <SBMLMap SBMLid="pERK" COPASIkey="Metabolite_1042"/>
    <SBMLMap SBMLid="pGSK3B" COPASIkey="Metabolite_1043"/>
    <SBMLMap SBMLid="pMEK" COPASIkey="Metabolite_1044"/>
    <SBMLMap SBMLid="pP90Rsk" COPASIkey="Metabolite_1045"/>
    <SBMLMap SBMLid="pPI3K" COPASIkey="Metabolite_1046"/>
    <SBMLMap SBMLid="pRKIP" COPASIkey="Metabolite_1047"/>
    <SBMLMap SBMLid="pRaf1" COPASIkey="Metabolite_1048"/>
    <SBMLMap SBMLid="pRap1" COPASIkey="Metabolite_1049"/>
    <SBMLMap SBMLid="pRas" COPASIkey="Metabolite_1050"/>
    <SBMLMap SBMLid="pSOS" COPASIkey="Metabolite_1051"/>
    <SBMLMap SBMLid="v1" COPASIkey="Reaction_1121"/>
    <SBMLMap SBMLid="v10a" COPASIkey="Reaction_1122"/>
    <SBMLMap SBMLid="v10b" COPASIkey="Reaction_1123"/>
    <SBMLMap SBMLid="v11a" COPASIkey="Reaction_1124"/>
    <SBMLMap SBMLid="v11b" COPASIkey="Reaction_1125"/>
    <SBMLMap SBMLid="v12" COPASIkey="Reaction_1126"/>
    <SBMLMap SBMLid="v13" COPASIkey="Reaction_1127"/>
    <SBMLMap SBMLid="v14" COPASIkey="Reaction_1128"/>
    <SBMLMap SBMLid="v15a" COPASIkey="Reaction_1129"/>
    <SBMLMap SBMLid="v15b" COPASIkey="Reaction_1130"/>
    <SBMLMap SBMLid="v15c" COPASIkey="Reaction_1131"/>
    <SBMLMap SBMLid="v16a" COPASIkey="Reaction_1132"/>
    <SBMLMap SBMLid="v16b" COPASIkey="Reaction_1133"/>
    <SBMLMap SBMLid="v18a" COPASIkey="Reaction_1134"/>
    <SBMLMap SBMLid="v18b" COPASIkey="Reaction_1135"/>
    <SBMLMap SBMLid="v19a" COPASIkey="Reaction_1136"/>
    <SBMLMap SBMLid="v19b" COPASIkey="Reaction_1137"/>
    <SBMLMap SBMLid="v19c" COPASIkey="Reaction_1138"/>
    <SBMLMap SBMLid="v2" COPASIkey="Reaction_1139"/>
    <SBMLMap SBMLid="v20" COPASIkey="Reaction_1140"/>
    <SBMLMap SBMLid="v21" COPASIkey="Reaction_1141"/>
    <SBMLMap SBMLid="v22a" COPASIkey="Reaction_1142"/>
    <SBMLMap SBMLid="v22b" COPASIkey="Reaction_1143"/>
    <SBMLMap SBMLid="v23a" COPASIkey="Reaction_1144"/>
    <SBMLMap SBMLid="v23b" COPASIkey="Reaction_1145"/>
    <SBMLMap SBMLid="v24" COPASIkey="Reaction_1146"/>
    <SBMLMap SBMLid="v25" COPASIkey="Reaction_1147"/>
    <SBMLMap SBMLid="v26a" COPASIkey="Reaction_1148"/>
    <SBMLMap SBMLid="v26b" COPASIkey="Reaction_1149"/>
    <SBMLMap SBMLid="v27a" COPASIkey="Reaction_1150"/>
    <SBMLMap SBMLid="v27b" COPASIkey="Reaction_1151"/>
    <SBMLMap SBMLid="v27c" COPASIkey="Reaction_1152"/>
    <SBMLMap SBMLid="v27d" COPASIkey="Reaction_1153"/>
    <SBMLMap SBMLid="v28" COPASIkey="Reaction_1154"/>
    <SBMLMap SBMLid="v29" COPASIkey="Reaction_1155"/>
    <SBMLMap SBMLid="v3" COPASIkey="Reaction_1156"/>
    <SBMLMap SBMLid="v30" COPASIkey="Reaction_1157"/>
    <SBMLMap SBMLid="v31" COPASIkey="Reaction_1158"/>
    <SBMLMap SBMLid="v32a" COPASIkey="Reaction_1159"/>
    <SBMLMap SBMLid="v32b" COPASIkey="Reaction_1160"/>
    <SBMLMap SBMLid="v33a" COPASIkey="Reaction_1161"/>
    <SBMLMap SBMLid="v33b" COPASIkey="Reaction_1162"/>
    <SBMLMap SBMLid="v33c" COPASIkey="Reaction_1163"/>
    <SBMLMap SBMLid="v34" COPASIkey="Reaction_1164"/>
    <SBMLMap SBMLid="v35" COPASIkey="Reaction_1165"/>
    <SBMLMap SBMLid="v36" COPASIkey="Reaction_1166"/>
    <SBMLMap SBMLid="v37a" COPASIkey="Reaction_1167"/>
    <SBMLMap SBMLid="v37b" COPASIkey="Reaction_1168"/>
    <SBMLMap SBMLid="v37c" COPASIkey="Reaction_1169"/>
    <SBMLMap SBMLid="v38" COPASIkey="Reaction_1170"/>
    <SBMLMap SBMLid="v39" COPASIkey="Reaction_1171"/>
    <SBMLMap SBMLid="v4" COPASIkey="Reaction_1172"/>
    <SBMLMap SBMLid="v40" COPASIkey="Reaction_1173"/>
    <SBMLMap SBMLid="v41" COPASIkey="Reaction_1174"/>
    <SBMLMap SBMLid="v5" COPASIkey="Reaction_1175"/>
    <SBMLMap SBMLid="v6a" COPASIkey="Reaction_1176"/>
    <SBMLMap SBMLid="v6b" COPASIkey="Reaction_1177"/>
    <SBMLMap SBMLid="v7" COPASIkey="Reaction_1178"/>
    <SBMLMap SBMLid="v8a" COPASIkey="Reaction_1179"/>
    <SBMLMap SBMLid="v8b" COPASIkey="Reaction_1180"/>
    <SBMLMap SBMLid="v9a" COPASIkey="Reaction_1181"/>
    <SBMLMap SBMLid="v9b" COPASIkey="Reaction_1182"/>
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
