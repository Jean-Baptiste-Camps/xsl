# xsl
Various general purpose XSL stylesheets


## Stylesheets

### ODS_vers_XML.xsl
This stylesheet is a simple export filter from Open Document Stylesheet format to XML with colnames (first row) used as tag names. Empty cells are not exported, and neither are redundant empty columns.

It can be used either, in Libre Office, via *Tools/XML filters* or directly by extracting `content.xml` and applying the transformation.

