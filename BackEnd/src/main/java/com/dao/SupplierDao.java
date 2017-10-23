package com.dao;

import com.model.Supplier;
import java.util.List;


public interface SupplierDao
{
	public boolean insertSupplier(Supplier supplier);
	public List<Supplier> retreiveSupplier();
	public boolean deleteSupplier(Supplier supplier);
	public Supplier getSupplier(int catId);
	public boolean updateSupplier(Supplier supplier);
}
