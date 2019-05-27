import torch


def main():
    print(f"""
torch.cuda.is_available(): {torch.cuda.is_available()}
torch.cuda.device_count(): {torch.cuda.device_count()}
		""")
    print('-' * 30)
    for i in range(torch.cuda.device_count()):
        print(f'torch.cuda.get_device_name({i}): {torch.cuda.get_device_name(i)}')
    print('-' * 30)


if __name__ == '__main__':
    main()
