// src/components/Admin/OrderManagement.js
import React, { useState, useEffect } from "react";
import "../../css/AdminManagement.css";
import { fetchOrder } from "./HandleAPI_Admin";

const OrderManagement = () => {
  const [orderItems, setOrderItems] = useState([]);
  const [detailedOrders, setDetailedOrders] = useState([]);
  const [buktibayarModalOpen, setBuktiBayarModalOpen] = useState(false);
  const [currentOrderId, setCurrentOrderId] = useState(null);

  const formatter = new Intl.NumberFormat("id-ID", {
    style: "currency",
    currency: "IDR",
  });

  const openBuktiBayarModal = (id_product) => {
    setCurrentOrderId(id_product);
    setBuktiBayarModalOpen(true);
  };

  const closeBuktiBayarModal = () => {
    setCurrentOrderId(null);
    setBuktiBayarModalOpen(false);
  };

  useEffect(() => {
    const fetchData = async () => {
      try {
        const { orderItems, detailedOrders } = await fetchOrder();
        setOrderItems(orderItems);
        setDetailedOrders(detailedOrders);
      } catch (error) {
        console.error("Error fetching data product & category", error);
      }
    };

    fetchData();
  }, []);

  if (!orderItems || !detailedOrders) {
    return;
  }

  return (
    <div className="container-fluid container-admin">
      <h2>Kelola Order</h2>
      <div className="row">
        <div className="col-12 col-sm-12">
          <div className="list-group">
            {orderItems.map((item, index) => (
              <div
                className="list-group-item list-group-item-action py-3"
                key={item.no_order}
              >
                <div className="row align-items-center">
                  <div className="col-4">
                    <div>
                      <h6 className="mb-0 fw-bold">
                        No Order : {item.no_order}
                      </h6>
                      <p className="mb-0 opacity-75">
                        Total Bayar : {formatter.format(item.total_bayar)}
                      </p>
                    </div>
                  </div>
                  <div className="col-4">
                    <div>
                      <h6 className="mb-0 fw-bold">Detail Pesanan</h6>
                      <p className="mb-0 opacity-75">
                        {detailedOrders[index] &&
                          detailedOrders[index].map((detail) => (
                            <div key={detail.id_detail}>
                              <h6>
                                <img
                                  alt="Product"
                                  className="flex-shrink-0"
                                  height="64"
                                  src={`http://localhost:4000${detail.image}`}
                                  width="64"
                                />
                                {detail.product_name} x {detail.quantity}
                              </h6>
                            </div>
                          ))}
                      </p>
                    </div>
                  </div>
                  <div className="col-2">
                    {item.status_bayar === 1 && (
                      <div style={{ display: "flex", flexDirection: "column" }}>
                        <button
                          type="button"
                          className="bayar-button"
                          style={{ marginBottom: "10px" }}
                          onClick={() => openBuktiBayarModal(item.no_order)}
                        >
                          Lihat Bukti Bayar
                        </button>
                        <button
                          type="button"
                          className="bayar-button"
                          style={{ marginBottom: "10px" }}
                          // onClick={() => openBuktiBayarModal(item.no_order)}
                        >
                          Proses
                        </button>
                      </div>
                    )}
                  </div>

                  <div className="col-2 text-end">
                    <small className="opacity-50 text-nowrap">
                      {new Date(item.order_date).toLocaleDateString()}
                    </small>
                    <p className="mb-0">
                      {item.status_bayar === 0 ? (
                        <span className="badge text-bg-warning">
                          Belum Bayar
                        </span>
                      ) : item.status_bayar === 1 && item.status_order === 0 ? (
                        <span className="badge text-bg-success">
                          Menunggu Verifikasi
                        </span>
                      ) : item.status_bayar === 1 && item.status_order === 1 ? (
                        <span className="badge text-bg-warning">Dikemas</span>
                      ) : null}
                    </p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {buktibayarModalOpen && (
        <div
          className="modal fade show"
          style={{
            display: "block",
            paddingLeft: "17px",
          }}
        >
          <div className="modal-dialog">
            <div className="modal-content">
              <div className="modal-header">
                <h4 className="modal-title">
                  {
                    orderItems.find((item) => item.no_order === currentOrderId)
                      .no_order
                  }
                </h4>
                <button
                  className="btn-close"
                  type="button"
                  onClick={closeBuktiBayarModal}
                ></button>
              </div>
              <div className="modal-body">
                <table className="table">
                  <tbody>
                    <tr>
                      <th>Nama Bank</th>
                      <th>:</th>
                      <td>
                        {
                          orderItems.find(
                            (item) => item.no_order === currentOrderId
                          ).nama_bank
                        }
                      </td>
                    </tr>
                    <tr>
                      <th>Nama Pemilik Rekening</th>
                      <th>:</th>
                      <td>
                        {
                          orderItems.find(
                            (item) => item.no_order === currentOrderId
                          ).atas_nama
                        }
                      </td>
                    </tr>
                    <tr>
                      <th>No Rekening</th>
                      <th>:</th>
                      <td>
                        {
                          orderItems.find(
                            (item) => item.no_order === currentOrderId
                          ).no_rekening
                        }
                      </td>
                    </tr>
                    <tr>
                      <th>Total Bayar</th>
                      <th>:</th>
                      <td>
                        {formatter.format(
                          orderItems.find(
                            (item) => item.no_order === currentOrderId
                          ).total_bayar
                        )}
                      </td>
                    </tr>
                  </tbody>
                </table>
                <img
                  alt=""
                  className="img-fluid pad img-cent"
                  src={`http://localhost:4000${
                    orderItems.find((item) => item.no_order === currentOrderId)
                      .image_bayar
                  }`}
                />
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default OrderManagement;
