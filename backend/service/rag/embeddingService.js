let pipelinePromise = null;

const getPipeline = () => {
  if (!pipelinePromise) {
    pipelinePromise = import("@xenova/transformers")
      .then((transformers) =>
        transformers.pipeline("feature-extraction", "Xenova/all-MiniLM-L6-v2"),
      )
      .catch((error) => {
        pipelinePromise = null; 
        throw error;
      });
  }
  return pipelinePromise;
};

const generateEmbedding = async (text) => {
  try {
    if (!text || typeof text !== "string") {
      console.warn("Text không hợp lệ:", text);
      return null;
    }

    const pipelineInstance = await getPipeline();

    const output = await pipelineInstance(text, {
      pooling: "mean",
      normalize: true,
    });

    return Array.from(output.data);
  } catch (error) {
    console.error("Lỗi khi tạo Vector:", error.message);
    return null;
  }
};

const generateBatchEmbeddings = async (texts) => {
  try {
    const embeddings = await Promise.all(
      texts.map((text) => generateEmbedding(text)),
    );
    return embeddings;
  } catch (error) {
    console.error("Lỗi batch embedding:", error);
    return [];
  }
};

module.exports = { generateEmbedding, generateBatchEmbeddings };