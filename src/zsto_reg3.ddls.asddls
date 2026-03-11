@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'STO REGISTER'
@Metadata.ignorePropagatedAnnotations: true
define  view entity ZSTO_REG3
  as select from ZSTO_REG1



{
  key PurchaseOrder,
  key PurchaseOrderItem,
  key MaterialDocument,
  key MaterialDocumentItem,
  key MaterialDocumentYear,
      GoodsMovementType,
      InventoryStockType,
      case
       when GoodsMovementType = '641'
       then MaterialDocument
       end                          as PGI_DOC,

      case
      when GoodsMovementType = '641'
      then MaterialDocumentItem end as pgi_docitem,

      case
      when GoodsMovementType = '641'
      then MaterialDocumentYear end as pgi_docyear,



      PurchaseOrderCategory,
      DocumentCurrency,
      PO_DELETION_CODE,
      PO_UOM,
      po_qty,
      po_date,
      PurchasingDocumentItemOrigin,
      MaterialGroup,
      Material,
      MaterialType,
      MaterialDocumentRecordType,

      case
      when GoodsMovementType = '641'
      then  Plant end               as suppling_plant,

      case
      when GoodsMovementType = '641'
      then StorageLocation end as issue_StorageLocation,
      
        case
      when GoodsMovementType = '101'
      then StorageLocation end as recv_StorageLocation,
      
      
      
      MaterialBaseUnit,
      Batch,
      DocumentDate,
      CompanyCodeCurrency,
      PurchasingOrganization,
      IsEffectiveGoodsMovement,
      GoodsMovementIsCancelled,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      case
      when GoodsMovementType = '641'
      then GoodsMovementStkAmtInCCCrcy end as issue_amt,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      case
      when GoodsMovementType = '641'
      then MatlStkChangeQtyInBaseUnit end as issue_qty,
      CompanyCode,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      GoodsIssueAmountInCoCodeCrcy,
      case
      when GoodsMovementType = '101'
      then MaterialDocument
      end                           as GRN_DOC,

      case
      when GoodsMovementType = '101'
      then MaterialDocumentItem end as GRN_DOCITEM,

      case
      when GoodsMovementType = '101'
      then MaterialDocumentYear end as GRN_YEAR,

      case
      when GoodsMovementType = '101'
      then  Plant end               as reciving_plant,

      case
      when GoodsMovementType = '641'
      then PostingDate end as issue_date,

      case
      when GoodsMovementType = '101'
      then  PostingDate end               as reciving_date,


      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      MatlStkChangeQtyInBaseUnit,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      GRN_AMT,
      @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
      GRN_QTY,
      
      po_type,
      your_ref,
      our_ref,
      cretedby,
      hsn,
      prd_desc,
      old_code




}
