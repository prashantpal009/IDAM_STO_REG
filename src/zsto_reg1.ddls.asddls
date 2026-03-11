@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'STO REGISTER'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSTO_REG1
  as select from    I_PurchaseOrderItemAPI01 as A
    left outer join I_GoodsMovementCube      as B on  B.PurchaseOrder              = A.PurchaseOrder
                                                  and B.PurchaseOrderItem          = A.PurchaseOrderItem
                                                  and B.MaterialDocumentRecordType = 'MDOC'
                                                  and (
                                                     B.GoodsMovementType           = '641'
                                                     or B.GoodsMovementType        = '101'
                                                   )
                                                  and B.InventoryStockType         = '01'
                                                  
                                                  
   left outer join I_PurchaseOrderAPI01 as c on c.PurchaseOrder = A.PurchaseOrder        
   left outer join I_Product as d on d.Product = A.Material   
   left outer join I_ProductPlantIntlTrd  as f on f.Product = A.Material and f.Plant = A.Plant  
   left outer join I_ProductDescription as i on i.Product = A.Material and i.Language = 'E'


{
  key    A.PurchaseOrder,
  key lpad(cast( A.PurchaseOrderItem as abap.char(6) ), 6, '0') as PurchaseOrderItem,
  key    B.MaterialDocument,
  key    B.MaterialDocumentItem,
  key    B.MaterialDocumentYear,
         A.PurchaseOrderCategory,
         A.DocumentCurrency,
         A.PurchasingDocumentDeletionCode as PO_DELETION_CODE,
         A.PurchaseOrderQuantityUnit as PO_UOM, 
         CAST(A.OrderQuantity as ABAP.DEC(23,2)) AS po_qty,
         c.CreationDate as po_date,
         A.PurchasingDocumentItemOrigin,
         A.MaterialGroup,
         A.Material,
         A.MaterialType,
         B.MaterialDocumentRecordType,
         B.Plant,                         
         B.StorageLocation,
         B.MaterialBaseUnit,
         B.Batch,
         B.DocumentDate,
         B.PostingDate,
         B.CompanyCodeCurrency,
         B.PurchasingOrganization,
         B.IsEffectiveGoodsMovement,
         B.GoodsMovementIsCancelled,
         @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
         B.GoodsMovementStkAmtInCCCrcy,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         B.MatlStkChangeQtyInBaseUnit,
         B.CompanyCode,
         @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
         B.GoodsIssueAmountInCoCodeCrcy,
         B.MaterialDocument               as GRN_DOC,
         B.MaterialDocumentItem           as GRN_DOCITEM,
         B.MaterialDocumentYear           as GRN_YEAR,
//         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
//         B.MatlStkChangeQtyInBaseUnit     ,
         @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
         B.GoodsReceiptAmountInCoCodeCrcy as GRN_AMT,
         @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
         B.GoodsReceiptQtyInBaseUnit      as GRN_QTY,
         B.GoodsMovementType,
         B.InventoryStockType,
         c.PurchaseOrderType    as po_type,
         c.CorrespncExternalReference   as your_ref,
         c.CorrespncInternalReference  as our_ref,
         c.CreatedByUser   as cretedby,
         f.ConsumptionTaxCtrlCode as hsn,
         i.ProductDescription      as prd_desc,
         d.ProductOldID            as old_code

         


}

where
       A.PurchaseOrderItemCategory  = '7'
  and  B.InventoryStockType         = '01'
  and  B.MaterialDocumentRecordType = 'MDOC'
  and(
       B.GoodsMovementType          = '641'
    or B.GoodsMovementType          = '101'
  )
