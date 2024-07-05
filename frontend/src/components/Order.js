import React, { useEffect, useState } from "react";
import Navbar from "./Navbar";
import Footer from "./Footer";
import "../css/Order.css";
import axios from "axios";

const BASE_URL = "http://localhost:4000";

const Order = () => {
  const [orderItems, setOrderItems] = useState([]);
  const [detailedOrders, setDetailedOrders] = useState([]);
  const [bayarModalOpen, setBayarModalOpen] = useState(false);
  const [currentOrderId, setCurrentOrderId] = useState(null);
  const [file, setFile] = useState(null);
  const [error, setError] = useState("");

  const [buktiBayar, setBuktiBayar] = useState({
    bankName: "",
    accountOwner: "",
    accountNumber: "",
  });

  const formatter = new Intl.NumberFormat("id-ID", {
    style: "currency",
    currency: "IDR",
  });

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setBuktiBayar((prevInfo) => ({ ...prevInfo, [name]: value }));
  };

  const handleFileChange = (e) => {
    const file = e.target.files[0];
    setFile(file);
  };

  const openBayarModal = (id_product) => {
    setCurrentOrderId(id_product);
    setBayarModalOpen(true);
  };

  const closeBayarModal = () => {
    setCurrentOrderId(null);
    setBayarModalOpen(false);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (
      !buktiBayar.bankName ||
      !buktiBayar.accountOwner ||
      !buktiBayar.accountNumber ||
      !file
    ) {
      setError("All fields are required.");
      return;
    }
    setError("");

    try {
      const formData = new FormData();
      formData.append("nama_bank", buktiBayar.bankName);
      formData.append("atas_nama", buktiBayar.accountOwner);
      formData.append("no_rekening", buktiBayar.accountNumber);
      formData.append("image", file);

      const token = localStorage.getItem("token");

      await axios.put(
        `${BASE_URL}/order/transaction-detail/edit/${currentOrderId}`,
        formData,
        {
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "multipart/form-data",
          },
        }
      );

      closeBayarModal();
    } catch (error) {
      console.error("Error submitting payment:", error);
    }
  };

  useEffect(() => {
    const fetchOrder = async () => {
      const token = localStorage.getItem("token");

      if (!token) {
        throw new Error("User not authenticated");
      }

      try {
        const response = await axios.get(`${BASE_URL}/order/transaction`, {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });
        setOrderItems(response.data.payload);

        const detailedData = await Promise.all(
          response.data.payload.map(async (item) => {
            const detailResponse = await axios.get(
              `${BASE_URL}/order/transaction-detail/${item.no_order}`,
              {
                headers: {
                  Authorization: `Bearer ${token}`,
                },
              }
            );
            return detailResponse.data.payload;
          })
        );

        setDetailedOrders(detailedData);
      } catch (error) {
        console.error("Error fetching orders:", error);
      }
    };

    fetchOrder();
  }, []);

  return (
    <>
      <Navbar />
      <div className="app-container">
        <div className="content-wrap">
          <div className="container py-5 h-100 mt-5">
            <div className="row">
              <div className="col-12 col-sm-12">
                <div className="card card-primary card-outline card-outline-tabs">
                  <div className="card-header border-bottom-0">
                    <h1 className="text-center">Pesanan Saya</h1>
                  </div>
                  <div className="card-body">
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
                                  Total Bayar :{" "}
                                  {formatter.format(item.total_bayar)}
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
                                          {detail.product_name} x{" "}
                                          {detail.quantity}
                                        </h6>
                                      </div>
                                    ))}
                                </p>
                              </div>
                            </div>
                            <div className="col-2">
                              {item.status_bayar === 0 && (
                                <button
                                  type="button"
                                  className="bayar-button"
                                  onClick={() => openBayarModal(item.no_order)}
                                >
                                  Bayar Sekarang
                                </button>
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
                                ) : item.status_bayar === 1 &&
                                  item.status_order === 0 ? (
                                  <span className="badge text-bg-info">
                                    Menunggu Konfirmasi
                                  </span>
                                ) : null}
                              </p>
                            </div>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {bayarModalOpen && (
            <div className="modal">
              <div className="modal-content-order">
                <div className="modal-header">
                  <h5 className="modal-title">Pembayaran</h5>
                  <button
                    type="button"
                    className="close"
                    onClick={closeBayarModal}
                  >
                    <span>&times;</span>
                  </button>
                </div>
                <div className="modal-body">
                  <div className="row">
                    <div className="col-6">
                      <div className="card card-primary">
                        <div className="card-header">
                          <h3 className="card-title">No Rekening</h3>
                        </div>
                        <div className="card-body">
                          <div className="form-group">
                            <p>
                              Silahkan transfer ke nomor rekening berikut
                              sejumlah :
                            </p>
                            <h1 className="text-primary">
                              {formatter.format(
                                orderItems.find(
                                  (item) => item.no_order === currentOrderId
                                ).total_bayar
                              )}
                            </h1>
                            <p />
                            <table className="table">
                              <tbody>
                                <tr>
                                  <th>Bank</th>
                                  <th>No Rekening</th>
                                  <th>Atas Nama</th>
                                </tr>
                                <tr>
                                  <td>Bank Mandiri</td>
                                  <td>132-003600-0009</td>
                                  <td>RAFR</td>
                                </tr>
                                <tr>
                                  <td>Bank Central Asia (BCA)</td>
                                  <td>6280-66-9600</td>
                                  <td>RAFR</td>
                                </tr>
                              </tbody>
                            </table>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div className="col-6">
                      <div className="card card-primary">
                        <div className="card-body">
                          {error && (
                            <div className="alert alert-danger">{error}</div>
                          )}

                          <form onSubmit={handleSubmit}>
                            <div className="form-group">
                              <label>Nama Bank:</label>
                              <input
                                type="text"
                                name="bankName"
                                className="form-control"
                                onChange={handleInputChange}
                              />
                              <label>Nama Pemilik Rekening:</label>
                              <input
                                type="text"
                                name="accountOwner"
                                className="form-control"
                                onChange={handleInputChange}
                              />
                              <label>No rekening:</label>
                              <input
                                type="text"
                                name="accountNumber"
                                className="form-control"
                                onChange={handleInputChange}
                              />

                              <label>Bukti Bayar:</label>
                              <input
                                type="file"
                                className="form-control-file"
                                onChange={handleFileChange}
                              />
                            </div>

                            <button
                              type="submit"
                              className="btn btn-edit-admin"
                            >
                              Bayar
                            </button>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          )}
        </div>
        <Footer />
      </div>
    </>
  );
};

export default Order;
