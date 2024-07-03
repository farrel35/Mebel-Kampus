import React, { useState, useEffect } from "react";
import "../../css/AdminManagement.css";

import { fetchProducts, fetchImageProducts } from "./HandleAPI_Admin";

const ProductImageManagement = () => {
  const [products, setProducts] = useState(null);
  const [productsImage, setImageProducts] = useState(null);
  const [file, setFile] = useState(null); // State to hold selected file
  const [error, setError] = useState("");
  const [addModalOpen, setAddModalOpen] = useState(false);

  const formatter = new Intl.NumberFormat("id-ID", {
    style: "currency",
    currency: "IDR",
  });

  const openAddModal = async (id_product) => {
    const imageProduct = await fetchImageProducts(id_product);
    setImageProducts(imageProduct);
    setAddModalOpen(true);
  };

  const closeAddModal = () => {
    setAddModalOpen(false);
  };

  useEffect(() => {
    const fetchData = async () => {
      try {
        const productsData = await fetchProducts();

        setProducts(productsData);
      } catch (error) {
        console.error("Error fetching data product & category", error);
      }
    };
    fetchData();
  }, []);

  if (!products) {
    return null;
  }

  // console.log(products);
  return (
    <div className="container-fluid container-admin">
      <h2>Kelola Produk</h2>
      <div className="table-responsive">
        <table className="table table-admin">
          <thead className="thead-light">
            <tr>
              <th>Id Produk</th>
              <th>Nama Produk</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {products.map((product) => (
              <tr key={product.id_product}>
                <td>{product.id_product}</td>
                <td>{product.product_name}</td>
                <td>
                  <button
                    className="btn btn-success btn-edit"
                    onClick={() => openAddModal(product.id_product)}
                  >
                    Tambah Foto
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      {addModalOpen && (
        <div className="modal">
          <div className="modal-content-admin">
            <div className="modal-header">
              <h5 className="modal-title">Tambah Produk</h5>
              <button type="button" className="close" onClick={closeAddModal}>
                <span>&times;</span>
              </button>
            </div>
            <div className="modal-body">
              <div className="row">
                <div className={!file ? "col-12" : "col-lg-7"}>
                  {error && <div className="alert alert-danger">{error}</div>}
                  <div className="list-group">
                    {productsImage.map((img, index) => (
                      <a
                        href="#"
                        className="list-group-item list-group-item-action d-flex gap-3 py-3"
                        aria-current="true"
                      >
                        <img
                          src={`http://localhost:4000${img.image}`}
                          alt="twbs"
                          width={128}
                          height={128}
                          className="flex-shrink-0"
                        />
                        <div className="d-flex gap-2 w-100 justify-content-between align-items-center">
                          <div>
                            <h6 className="mb-0">
                              <b>Keterangan</b>
                            </h6>
                            <p className="mb-0 opacity-75">{img.keterangan}</p>
                          </div>
                          <div className="d-flex align-items-center">
                            <button
                              className="btn btn-danger btn-sm"
                              // onClick={handleDelete}
                            >
                              Delete
                            </button>
                          </div>
                        </div>
                      </a>
                    ))}
                  </div>
                </div>
                {file && (
                  <div className="col-lg-5">
                    <img
                      src={URL.createObjectURL(file)}
                      alt="Preview"
                      className="img-fluid"
                    />
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default ProductImageManagement;
