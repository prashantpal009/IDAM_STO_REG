@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'STO REGISTER'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSTO_REG4
  as select distinct from ZSTO_REG3  as a
    left outer join       ZSTTO_REG2 as b on  b.PurchaseOrder     = a.PurchaseOrder
                                          and b.PurchaseOrderItem = a.PurchaseOrderItem
                                          
   left outer join I_Batch as j on j.Material = a.Material and j.Batch = a.Batch and j.Plant = a.suppling_plant 
   left outer join zplant_detail as l on l.Plant = a.suppling_plant 
   left outer join zplant_detail as m on m.Plant = a.reciving_plant 
   
                                      



{
  key a.PurchaseOrder,
  key a.PurchaseOrderItem,
  key a.PGI_DOC,
  key a.pgi_docitem,
  key a.pgi_docyear,
  key a.GRN_DOC,
  key a.GRN_DOCITEM,
  key a.GRN_YEAR,
  key b.DeliveryDocument,
//  key b.DeliveryDocumentItem,
      b.DeliveryDate,
      b.BillingDocument,
//      b.BillingDocumentItem,
      b.BillingDocumentDate,
      a.po_type,
      a.PO_DELETION_CODE,
      a.PO_UOM,
      a.po_qty,
      a.po_date,
      a.your_ref,
      a.our_ref,
      a.cretedby,
      a.hsn,
      a.prd_desc,
      a.old_code,
      a.CompanyCodeCurrency,
      a.MaterialBaseUnit,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      a.issue_amt,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      a.issue_qty,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      a.GRN_QTY,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      a.GRN_AMT,
       @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      a.MatlStkChangeQtyInBaseUnit ,
      a.suppling_plant,
      a.reciving_plant,
      l.PlantName as supp_plant_name ,
      m.PlantName as recv_plant_name, 
      a.issue_StorageLocation,
      a.recv_StorageLocation,
      j.ManufactureDate,
      j.ShelfLifeExpirationDate,
      b.AccountingDocument,
      b.DocumentReferenceID,
      a.reciving_date,
      a.issue_date,
      a.Batch

      
      



}
